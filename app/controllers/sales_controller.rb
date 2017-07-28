class SalesController < ApplicationController
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
end
