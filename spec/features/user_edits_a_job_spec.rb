require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = create(:company_with_jobs) 
    job1, job2, job3 = company.jobs
    category = job1.category
    visit company_job_path(company, job1)
    click_link "Edit"
    fill_in "Title", with: "Software Developer"
    fill_in "Description", with: "Ruby and stuff"
    fill_in "Level of interest", with: 55
    select(category.title, from: 'job_category_id')

    click_on "Update Job"

    expect(page).to have_content("Software Developer")
    expect(page).to have_content("Ruby and stuff")
    expect(page).to have_content("55")
    expect(page).to have_content(category.title)
  end
end
