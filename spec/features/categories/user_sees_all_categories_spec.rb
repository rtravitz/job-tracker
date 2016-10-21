require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all categories" do
    category1, category2 = create_list(:category, 2)
    visit categories_path
    save_and_open_page
    expect(page).to have_content("Category 2")
    expect(page).to have_content("Category 3")
  end
end
