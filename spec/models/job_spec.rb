require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", category_id: 1)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", category_id: 1)
        expect(job).to be_invalid
      end

      it "is invalid without a category id" do
        job = Job.new(title: "Developer", level_of_interest: 80, description: "Wahoo")
      end
    end

    context "valid attributes" do
      it "is valid with a title, description, category id, and level of interest" do
        job = Job.new(title: "Developer", level_of_interest: 80, description: "Wahoo", category_id: 1)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end

    it "belongs to a category" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:category) 
    end

    it "has many comments" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:comments)
    end
  end
end
