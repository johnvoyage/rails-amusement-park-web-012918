class SessionsController < ApplicationController

  def index
    @users = User.all 
  end

  def new
  end

  def create
    binding.pry
  end

  def destroy
  end

end
