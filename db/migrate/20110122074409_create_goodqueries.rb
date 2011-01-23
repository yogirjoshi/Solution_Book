class CreateGoodqueries < ActiveRecord::Migration
  def self.up
    create_table :goodqueries do |t|
      t.integer :question_id
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :goodqueries
  end
end
