class UsersController < ApplicationController
   def log_in
    if session[:id] == nil
      flash[:info]="Enter you login and password"
      redirect_to "/"
    else
      @current_user = User.find(session[:id])
    end
  end

  def index
    log_in
    @users = User.all
  end

  def create
    @user_admin = User.where(password: params[:password]).first
    if (@user_admin and (@user_admin.privilege == "root"))
      redirect_to '/users/new'
     else
      redirect_to '/users'
   end
  end


  def show
    log_in
    @user = User.find(params[:id])
  end

end
