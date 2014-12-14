class GitHubInfo < ActiveRecord::Base
    has_many :git_hub_repo
    def self.instance
      return GitHubInfo.all.first if GitHubInfo.all.length > 0
      GitHubInfo.new
    end
    def load_repos
      if last_update != Date.today then
        repo_info = retrieve_from_github
        repo_info.each_pair do |repo_name, repo_stats|
          repo = GitHubRepo.find_by_name repo_name
          repo = GitHubRepo.new(:name => repo_name) if repo == nil
          Rails.logger.info "stats: #{repo_stats}"
          repo.retrieve_from_hash repo_stats
          repo.save
        end
        self.last_update = Date.today
        self.save
      end
      GitHubRepo.all
    end
    def all_languages_lines
      all_lines = Hash.new(0)
      all_repos = load_repos
      all_repos.each do |repo|
        lines = repo.languages_to_json
        lines.each_pair do |lang_name, num_lines|
          all_lines[lang_name] += num_lines
        end
      end
      all_lines
    end
    def retrieve_from_github
        @client ||= Octokit::Client.new :access_token =>  ENV["GITHUB_TOKEN"]
        repositories = {}
        language_obj = {}
        @client.repos.each do |repo|
          repositories[repo.name] = {}
          language_obj = {}
          @client.languages(("#{@client.login}/#{repo.name}")).each do |lang_name, lines|
              if !language_obj[lang_name]
                language_obj[lang_name] = lines
              else
                language_obj[lang_name] += lines
              end
          end
          repositories[repo.name][:languages] = language_obj
          all_commits = @client.commits("#{@client.login}/#{repo.name}")
          repositories[repo.name][:num_commits] = all_commits.length
          repositories[repo.name][:last_commit] = all_commits.first.commit.author.date
        end
        return repositories
    end
end
