class CreateGitHubInfos < ActiveRecord::Migration
  def change
    create_table :git_hub_infos do |t|
      t.date :last_update

      t.timestamps
    end
  end
end
