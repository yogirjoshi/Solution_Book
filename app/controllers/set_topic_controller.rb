class SetTopicController < ApplicationController
  def add_topic
	if request.get?
		@topic = Topic.new
	else
		@topic = Topic.new(params[:topic])
		if @topic.save
			@topic = nil
			flash[:notice] = "Topic Added Successfully"
		else
			flash[:notice] = "Error in adding Topic"
		end
	end
  end

  def delete_topic
  end

  def show_topics
	@topics = Topic.find(:all)
	@topic_count= @topics.size
  end
  
  def view_topic
	@topic= Topic.find_by_id(params[:id])
  end 
end
