Company.destroy_all
Job.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
CATEGORIES = ["Tech","Education","Consulting", "Marketing"]
CATEGORY_KEYS = [1, 1, 1, 1, 2, 1, 3, 4] 
CATEGORIES.each do |title|
  Category.create!(title: title)
end

COMPANIES.each do |name|
  company = Company.create!(name: name, city: CITIES.sample)
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), category_id: CATEGORY_KEYS.sample)
  end
end
