class ProgrammingLanguage < ActiveRecord::Base
    belongs_to :git_hub_repo
    belongs_to :repo_languages
end
