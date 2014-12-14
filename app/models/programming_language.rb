class ProgrammingLanguage < ActiveRecord::Base
     has_many :repo_languages
     has_many :git_hub_repos, through: :repo_languages
end
