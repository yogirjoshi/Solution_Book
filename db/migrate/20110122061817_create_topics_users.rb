class CreateTopicsUsers < ActiveRecord::Migration
  def self.up
    create_table :topics_users do |t|
      t.integer :topic_id
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :topics_users
  end
end
