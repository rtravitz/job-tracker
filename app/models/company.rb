class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts

  def self.by_city(desired_city)
    Company.where(city: desired_city)
  end

  def self.top_3_by_average_interest
    Company.all.sort_by do |company|
      company.jobs.average(:level_of_interest)
    end.reverse[0..2]
  end

  def self.job_count_by_location
    Company.joins(:jobs).group(:city).count
  end

  def average_level_of_interest
    self.jobs.average(:level_of_interest).round(3)
  end

end
