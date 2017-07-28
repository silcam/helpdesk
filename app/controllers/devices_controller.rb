class DevicesController < ApplicationController
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
    @devices = Device.all
  end

  def show
    log_in
    @users = User.all
    @device = Device.find(params[:id])
  end


  def new
    log_in
    @users = User.all
    @devices_hard = Device.where(category: "hardware")
    @devices_net = Device.where(category: "network")
    @devices_soft = Device.where(category: "software")
    @devices_electro = Device.where(category: "electronic")
    @devices_electri = Device.where(category: "electricity")
  end

  def update
    Device.find(params[:id]).update stock: somme(params[:stock], params[:last_stock])
    redirect_to '/devices/#{params[:id]}'
  end

  def create
    Device.create(name: params[:name], category: params[:category], model: params[:model], description: params[:description], user_id: params[:user_id], stock: params[:stock])
    redirect_to '/devices'
  end

  def somme a , b
     return a.to_i + b.to_i
  end


end
