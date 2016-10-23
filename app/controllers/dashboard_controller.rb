class DashboardController < ApplicationController
  
  def index
    @count_by_interest = Job.count_by_interest
    @top_3 = Company.top_3_by_average_interest
    @count_by_location = Company.count_by_location
  end

end
