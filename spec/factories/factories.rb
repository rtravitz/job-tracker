FactoryGirl.define do

  sequence :name, ["A", "B", "C"].cycle do |n|
    "Company #{n}"
  end

  sequence :city do |n|
    "City#{n}"
  end

  sequence :title do |n|
    "Title#{n}"
  end

  sequence :category_title do |n|
    "Category #{n}"
  end

  sequence :description do |n|
    "Description#{n}"
  end

  sequence :level_of_interest do |n|
    "Interest Level #{n}"
  end
  
  factory :job do
    title
    description
    level_of_interest
    category {create(:category)}
  end

  factory :category do
    title {generate(:category_title)}
  end

  factory :company do
    name
    city
    factory :company_with_jobs do
      jobs {create_list(:job, 3)}
    end
  end
end
