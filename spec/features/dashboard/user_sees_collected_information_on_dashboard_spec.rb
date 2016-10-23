require 'rails_helper'

describe "User sees aggregated information in dashboard" do
  scenario "user sees a count of jobs at each interest level" do
    job1, job2, job3 = create_list(:job, 3)
    job1.update(level_of_interest: 3)

    visit(dashboard_index_path)

    within ".level_of_interest" do
      expect(page).to have_content(0)
      expect(page).to have_content(2)
      expect(page).to have_content(3)
      expect(page).to have_content(1)
    end
  end
end
