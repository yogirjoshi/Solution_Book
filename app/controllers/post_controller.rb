class PostController < ApplicationController
  before_filter :authorize	
  def post_question
	if request.get?
		@question = Question.new
		@topicnames=Topic.find(:all).map{ |topic| topic.name }

	else
		@question = Question.new(params[:question])
		@question.user_id = session[:user_id]
		@selected_topic = Topic.find_by_name(params["topic"]["name"])	
		@question.topic_id = @selected_topic.id
		@question.save
		flash[:notice] = "Question number #{@question.id} posted"
		@question = nil
		redirect_to( :controller => "login", :action => 'index' )
	end
  end

  def post_answer
  end

  def rate_question
  end

  def rate_answer
  end

end
