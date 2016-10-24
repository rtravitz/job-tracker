require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = create(:company_with_jobs)
    job1, job2, job3 = company.jobs

    visit company_path(company)

    expect(page).to have_content(company.name)
    expect(page).to have_content(job1.title)
    expect(page).to have_content(job2.title)
    expect(page).to have_content(job3.title)
  end

  scenario "user can sort jobs by level of interest" do
    company1 = create(:company_with_jobs)
    job1, job2, job3 = company1.jobs

    visit("#{company_jobs_path(company1)}/?sort=interest")

    within(".jobs ul:first-child") do
      expect(page).to have_content(job1.title)
    end

    within(".jobs ul:last-child") do
      expect(page).to have_content(job2.title)
    end
  end
end
