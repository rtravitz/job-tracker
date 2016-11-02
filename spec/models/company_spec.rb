require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new(city: "Denver")
        expect(company).to be_invalid
      end

      it "is invalid without a city" do
        company = Company.new(name: "Ericsson")
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox", city: "Denver")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name and city" do
        company = Company.new(name: "Dropbox", city: "Denver")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox", city: "Denver")
      expect(company).to respond_to(:jobs)
    end

    it "has many contacts" do
      company = Company.new(name: "Dropbox", city: "Denver")
      expect(company).to respond_to(:contacts)
    end
  end

  describe "#find_by_city" do
    it "returns the correct cities" do
      Company.create(name: "Company 1", city: "Oakland") 
      Company.create(name: "Company 2", city: "Seattle") 
      Company.create(name: "Company 3", city: "Oakland") 

      returned = Company.by_city("Oakland")

      expect(returned.count).to eq(2)
    end
  end

  describe "#top_3_by_average_interest" do
    it "returns the top companies by average job interest" do
      company1, company2, company3, company4 = create_list(:company_with_jobs, 4)  
      top_3 = Company.top_3_by_average_interest

      expect(top_3.first.jobs.average(:level_of_interest).to_f).to eq(3.0)
      expect(top_3[1].jobs.average(:level_of_interest).to_f.round(3)).to eq(2.667)
      expect(top_3.last.jobs.average(:level_of_interest).to_f.round(3)).to eq(2.333)
      expect(top_3.count).to eq(3)
    end
  end

  describe "#job_count_by_location" do
    it "returns the correct number of jobs per location" do
      company1, company2, company3, company4 = create_list(:company_with_jobs, 4)
      company4.update(city: company1.city)
      result = Company.job_count_by_location

      expect(result[company1.city]).to eq(6)
      expect(result[company2.city]).to eq(3)
      expect(result[company3.city]).to eq(3)
    end
  end
end
