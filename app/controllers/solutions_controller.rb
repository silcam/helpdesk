class SolutionsController < ApplicationController
  
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
    @jobs= JobRequest.where(statut: "solve")
    @users = User.all
  end

  def create
    log_in
    Solution.create params_solution
    flash[:info] = "A problem has just been solved"
    redirect_to '/solutions'
    
  end


  def new
    log_in
    @cond ="not"
    @solutions = JobRequest.where(statut: @cond)
    @solution = Solution.new
    @session = session[:id]
  end

  def show
     log_in
    @job= JobRequest.find(params[:id])
    @users = User.all
  end


  def destroy
   Solution.find(params[:id]).destroy
   redirect_to "/solutions"
  end


  def params_solution
   params.require(:solution).permit(:job_resquest_id, :description, :time_spent, :date_return, :user_id, :statut)
  end



end
