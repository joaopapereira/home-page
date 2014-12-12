class GitHubInfo < ActiveRecord::Base
    has_many :git_hub_repo
    def load_repos
      if last_update != Date.today then
        repo_info = retrieve_from_github
        repo_info.each_pair do |repo_name, repo_stats|
          repo = GitHubRepo.find_by_name repo_name
          repo = GitHubRepo.new(:name => repo_name) if repo == nil
          repo.retrieve_from_hash repo_stats
          repo.save
        end
      end
      GitHubRepo.all
    end
    def retrieve_from_github
        @client ||= Octokit::Client.new :access_token =>  ENV["GITHUB_TOKEN"]
        language_obj = {}
        @client.repos.each do |repo|
          @client.languages(("#{@client.login}/#{repo.name}")).each do |lang_name, lines|
              if !language_obj[lang_name]
                language_obj[lang_name] = lines
              else
                language_obj[lang_name] += lines
              end
          end
        end
        @language_lines = "["
        language_obj.each do |lang_name, lines|
          @language_lines += "[\"#{lang_name.to_s}\", #{lines}],"
        end
        @language_lines += "]"
    end
end
