class ConnexionController < ApplicationController
  def index
    @users = User.all
  end

def create
    @current_user = User.where(login: params[:login], password: params[:password]).first
    if @current_user
      flash[:info]= " Welcome #{@current_user.last_name} "
      session[:id] = @current_user.id
      redirect_to "/connexion/new"

    else
      flash[:info]= "Error: verify your login and/or password"
      session[:id] = nil
      redirect_to "/"
    end
end

 def destroy
    session[:id]= nil
    flash[:info]="Good Bye!!! You are deconnected"
    redirect_to "/"
  end

def new
    @jobs= JobRequest.all
     @users = User.all
    @departments = Departement.all
    @sales = Sale.all
    @devices = Device.all
    
    @jobs_solve = JobRequest.where(statut: "ok")
    @jobs_not_solve = JobRequest.where(statut: "not")
    
    #@devices_stock_warning = Device.where(stock: < 6)
    #@devices_stock_low = Device.where(stock: < 2)
    #devices_stock_ok = Device.where(stock: >= 6)


    @session = session[:id]
    @current_user = User.find(session[:id])
   
  end




end
