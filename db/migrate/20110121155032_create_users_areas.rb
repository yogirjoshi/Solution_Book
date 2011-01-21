class CreateUsersAreas < ActiveRecord::Migration
  def self.up
    create_table :users_areas do |t|
      t.integer :user_id
      t.integer :area_id
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :users_areas
  end
end
