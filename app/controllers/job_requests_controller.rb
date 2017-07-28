class JobRequestsController < ApplicationController

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
    @jobs = JobRequest.all
    @users = User.all
    @solutions = Solution.all
  end

  def create
   JobRequest.create job_params
   redirect_to '/job_requests/new'
  end


  def new
    log_in
    @job_request = JobRequest.new
    @departments = Departement.all
    @session = session[:id]
  end

  def show
    log_in
    @job = JobRequest.find(params[:id])
  end
  
  def destroy
   JobRequest.find(params[:id]).destroy
   redirect_to '/job_requests'
  end

  def update
    JobRequest.find(params[:id]).update description_solution: params[:description_solution], time_spent: params[:timp_spent], date_return: params[:date_return], statut: params[:statut]
    redirect_to "/job_requests/#{params[:id]}"
  end



  def job_params
    params.require(:job_request).permit(:name_customer, :department, :email, :telephone, :priority, :account_charge, :cash, :device_name, :model, :parts_atteched, :description_problem, :date_arrive, :user_id,:description_solution, :timp_spent, :date_return, :statut)

  end

  
end
