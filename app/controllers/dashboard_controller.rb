class DashboardController < ApplicationController
  
  def index
    @count_by_interest = Job.count_by_interest
  end

end
