require 'rails_helper'

describe "User deletes existing category" do
  scenario "a user can delete a category" do
    category1, category2 = create_list(:category, 2)
    visit categories_path

    within(".category_#{category1.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("#{category1.title} was successfully deleted!")
  end
end
