class DatabaseCreation < ActiveRecord::Migration
  def change
    create_table(:links) do |t|
           t.string :name
           t.string :url
     end
  end
end
