require 'rails_helper'

describe "User creates a new comment" do
  scenario "a user can create comments" do
    company = create(:company_with_jobs)
    job = company.jobs.first

    visit(company_job_path(company, job))

    fill_in "comment_content", with: "Love this job!"
    click_button "Create Comment"
    fill_in "comment_content", with: "Talked to a hiring manager"
    click_button "Create Comment"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Love this job!")
    expect(page).to have_content("Talked to a hiring manager")
  end
end
