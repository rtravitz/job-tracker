require 'rails_helper'

describe "User creates a new contact" do
  scenario "a user can create a new contact" do
    company = create(:company)

    visit company_path(company)

    fill_in "contact_full_name", with: "Abraham Lincoln"
    fill_in "contact_position", with: "President"
    fill_in "contact_email", with: "abe@whitehouse.gov"
    click_button "Create Contact"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("Abraham Lincoln")
    expect(page).to have_content("abe@whitehouse.gov")
    expect(page).to have_content("President")
  end
end
