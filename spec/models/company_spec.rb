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
end
