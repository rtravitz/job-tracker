class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts

  def self.by_city(desired_city)
    Company.where(city: desired_city)
  end
end
