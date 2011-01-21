class AddTopicIdToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :topic_id, :integer
  end

  def self.down
    remove_column :questions, :topic_id
  end
end
