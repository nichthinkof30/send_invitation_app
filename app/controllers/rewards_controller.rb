class RewardsController < ApplicationController
  
  before_filter :authorize
  
  def index
    @reward = Reward.all
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(params[:reward])
    @reward.user = current_user

    if @reward.save
      redirect_to root_url, notice: "Successfully created reward!"
    else
      render "new"
    end
  end

  def show

  end

end
