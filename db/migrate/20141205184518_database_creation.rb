class DatabaseCreation < ActiveRecord::Migration
  def change
    create_table(:links) do |t|
           t.string :name
           t.string :url
    end
    create_table :git_hub_infos do |t|
      t.date :last_update

      t.timestamps
    end
    create_table :programming_languages do |t|
      t.string :name

      t.timestamps
    end
    create_table :git_hub_repos do |t|
      t.string :name
      t.integer :num_commits
      t.date :last_commit

      t.timestamps
    end
    create_table :repo_languages do |t|
      t.belongs_to :git_hub_repo
      t.belongs_to :programming_language
      t.integer :number_lines
      t.integer :other_info

      t.timestamps
    end
  end
end
