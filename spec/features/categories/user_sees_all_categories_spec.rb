require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all categories" do
    category1, category2 = create_list(:category, 2)
    visit categories_path
    
    expect(page).to have_content(category1.title)
    expect(page).to have_content(category2.title)
  end
end
