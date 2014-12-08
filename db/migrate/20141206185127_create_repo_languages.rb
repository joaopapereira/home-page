class CreateRepoLanguages < ActiveRecord::Migration
  def change
    create_table :repo_languages do |t|
      t.belongs_to :git_hub_repo
      t.belongs_to :programming_languages
      t.integer :number_lines

      t.timestamps
    end
  end
end
