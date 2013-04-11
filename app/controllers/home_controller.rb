class HomeController < ApplicationController
  
  before_filter :authorize
         
  def index
    @rewards = current_user.rewards
  end

end
