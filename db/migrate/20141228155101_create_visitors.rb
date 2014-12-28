class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :ip
      t.string :country
      t.string :small_country
      t.string :city

      t.timestamps
    end
  end
end
