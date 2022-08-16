class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    p current_user
    
    
  end
end
