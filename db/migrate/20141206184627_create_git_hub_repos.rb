class CreateGitHubRepos < ActiveRecord::Migration
  def change
    create_table :git_hub_repos do |t|
      t.string :name
      t.integer :num_commits
      t.date :last_commit

      t.timestamps
    end
  end
end
