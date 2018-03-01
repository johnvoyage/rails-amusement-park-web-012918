class UsersController < ApplicationController

  def index
    render :new
  end

  def new
    # byebug
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # binding.pry
    if @user.save
      # binding.pry
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
      # redirect_to controller: "sessions" action: "create"
    else
      redirect_to '/'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

end
