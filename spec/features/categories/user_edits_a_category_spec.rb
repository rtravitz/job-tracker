require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = create(:category)
    visit categories_path
    click_link "Edit"
    fill_in "Title", with: "Entertainment"
    click_on "Update Category"

    expect(page).to have_content("Entertainment")
  end
end
