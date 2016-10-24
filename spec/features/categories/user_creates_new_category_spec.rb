require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    visit categories_path
    click_link("Add a Category")

    fill_in "category[title]", with: "QA"
    click_button "Create"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("QA")
    expect(Category.count).to eq(1)
  end

  scenario "a user cannot create a category that already exists" do
    Category.create(title: "QA")

    visit new_category_path

    fill_in "category[title]", with: "QA"
    click_button "Create"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Create a New Category")
    expect(Category.count).to eq(1)
  end
end
