require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = create(:company_with_jobs)
    job1, job2, job3 = company.jobs

    visit company_job_path(company, job1)

    expect(page).to have_content(company.name)
    expect(page).to have_content(job1.title)
    expect(page).to have_content(job1.level_of_interest)
    expect(page).to have_content(job1.category.title)
  end
end
