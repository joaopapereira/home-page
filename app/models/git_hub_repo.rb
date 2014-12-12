class GitHubRepo < ActiveRecord::Base
     has_many :programming_language
     has_many :repo_languages, through: :programming_language
     def retrieve_from_hash repo_stats
     end
end
