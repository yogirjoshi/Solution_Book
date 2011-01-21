class PostController < ApplicationController
  def post_question
	if request.get?
		@question = Question.new
	else
		@question = Question.new(params[:question])
		@question.user_id = session[:user_id]
		@question.save
		flash[:notice] = "Question number #{@question.id} posted"
		@question = nil
		@user = User.find_by_id(session[:user_id])
		@user.inspect
		@questions=@user.questions
		@questions.inspect
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
