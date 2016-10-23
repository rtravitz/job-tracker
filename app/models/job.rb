class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :description, :category_id,  presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.count_by_interest 
    Job.order(level_of_interest: :desc).group(:level_of_interest).count
  end

end
