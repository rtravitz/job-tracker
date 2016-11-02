require 'rails_helper'

describe "User deletes an existing job" do
  scenario "a user can delete a job" do
    company = create(:company_with_jobs)
    job1, job2, job3 = company.jobs
    visit company_jobs_path(company)
    within(".job_#{job1.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("#{job1.title} was successfully deleted!")
  end
end
