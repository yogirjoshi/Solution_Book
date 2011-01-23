class LoginController < ApplicationController
  before_filter :authorize, :except => [ :login, :add_user ]
  def add_user
	if request.get?
		@user = User.new
	else
		@user = User.new(params[:user])
		@user.save
		@user = nil
		flash[:notice] = "User Added Successfully"
	end
  end

  def login
	if request.get?
		session[:user_id] = nil
		session[:user_name] = nil
		@user = User.new
	else
		@user = User.new(params[:user])
		logged_in_user = @user.try_to_login
		if logged_in_user
			session[:user_id] = logged_in_user.id
			session[:user_name] = logged_in_user.name
			@message = "Login Successful for #{@user.name}"
			@questions = @user.questions
			redirect_to(:action => "index", :message => @message)
		else
			@error = "Invalid user/password combination"
			redirect_to(:action => "error", :message => @error)
		end	
	end
  end

  def logout
	flash[:notice] = "Dear #{session[:user_name]}, you are successfully Logged out"
	session[:user_id] = nil
	session[:user_name] = nil
	redirect_to(:action => "login")
     end


  def delete_user
  end

  def list_users
  end
  
  def index
		@user = User.find_by_id(session[:user_id])
		@questions=Question.find(:all,:order => "rating desc,updated_at desc")
  end  
  
  def error
  end
end
