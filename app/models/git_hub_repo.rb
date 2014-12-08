class GitHubRepo < ActiveRecord::Base
     has_many :programming_language
     has_many :repo_languages, through: :programming_language
end
