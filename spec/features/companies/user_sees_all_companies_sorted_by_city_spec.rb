require 'rails_helper'

describe "User sees all companies by selected city" do
  scenario "a user sees all the companies located in a specific city" do
    Company.create(name: "1", city: "Oakland")
    Company.create(name: "2", city: "Seattle")
    Company.create(name: "3", city: "Oakland")

    visit("#{companies_path}?sort=Oakland")
    
    within(".companies") do
      expect(page).to have_selector('ul', count: 2)
      expect(page).to_not have_content("Seattle")
    end
  end
end
