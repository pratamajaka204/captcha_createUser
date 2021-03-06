class UsersController < ApplicationController
  def index
  	@user = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params_user)
  	if @user.save
  		flash[:notice] = "Success Add Records"
  		redirect_to root_url
  	else
  		flash[:error] = "Data Not Valid"
  		render "new"
  	end
  end

  def edit
  end

  private 
  def params_user
  		params.require(:user).permit(:username, :email, :password, :humanizer_answer, :humanizer_question_id)
end
end
