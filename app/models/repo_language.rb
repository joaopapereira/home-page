class RepoLanguage < ActiveRecord::Base
    belongs_to :git_hub_repo
    belongs_to :programming_language
end
