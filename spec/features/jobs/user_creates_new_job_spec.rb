require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create(name: "ESPN", city: "NYC")
    category1, category2, category3 = create_list(:category, 3)
    visit new_company_job_path(company)
    save_and_open_page
    expect(page).to have_selector(:link_or_button, "Create New Category")

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    select("#{category1.title}", from: 'job_category_id')

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content(category1.title)
  end
end
