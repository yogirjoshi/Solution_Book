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
		if TopicsUsers.find(:all, :conditions => "user_id = #{session[:user_id]} and topic_id = #{@selected_topic.id}").empty?
			@topicsusers = TopicsUsers.new(:topic_id =>  @selected_topic.id, :user_id => session[:user_id], :rating => 0)
			@topicsusers.save
		end
		@question.save
		flash[:notice] = "Question number #{@question.id} posted"
		@question = nil
		redirect_to( :controller => "login", :action => 'index' )
	end
  end

  def post_answer
	if request.get?
		@question=Question.find(params[:id])
		@answer=Answer.new
		@answer.question_id=@question.id 
	else
		@answer=Answer.new(params[:answer])
		@answer.rating=0
		@answer.user_id=session[:user_id]
		@answer.question_id=params["answer"]["question_id"]
		@answer.save
		@question=Question.find(params["answer"]["question_id"])
	end	
  end
  
  def view_answer 
  	#if request.get? 
  		@question=Question.find(params[:id])
  		@user=User.find_by_id(@question.user_id) 
  		@answers=Answer.find(:all,:conditions => "question_id =#{@question.id}", :order=>"rating desc, updated_at desc") 
  	#else 
  	#	@question=Question.find(params[:id])
  	#	@user=User.find_by_id(@question.user_id) 
  	#	@answers=@question.answers 
  	#end 
  end

  def rate_question
	@question=Question.find(params[:id])
	@topic=Topic.find(@question.topic_id)
	@topicsuser=TopicsUsers.find(:all, :conditions => "user_id = #{session[:user_id]} and topic_id = #{@topic.id}")
	if @topicsuser.empty?
		rating=1	
	else
		rating= @topicsuser.first.rating
		if rating == 0
			rating=1
		end
	end
	if Goodquery.find(:all, :conditions => "question_id = #{params[:id]} and user_id = #{session[:user_id]}").empty?
		@goodquery = Goodquery.new( :question_id => params[:id], :user_id => session[:user_id], :rating => rating)
		@goodquery.save
		@question.rating+=rating
		@question.save
		@topic_of_liked_questions_user=TopicsUsers.find(:all, :conditions => "user_id = #{@question.user_id} and topic_id = #{@topic.id}")
		@topic_of_liked_questions_user.first.rating+=rating
		@topic_of_liked_questions_user.first.save
	else
		flash[:notice] = "You already like this question"
	#	@goodquery = Goodquery.find(:all, :conditions => "question_id = params[:id] and user_id = session[:user_id]")
	#	@goodquery.rating+=rating
	end	

	redirect_to( :controller => "login", :action => 'index' )
  end

  def rate_answer
  end

end
