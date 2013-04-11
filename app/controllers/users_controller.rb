class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.generate_device_id
    if @user.save
      redirect_to log_in_path, notice: "Signed up and login now!"
    else
      render "new"
    end
  end

end
