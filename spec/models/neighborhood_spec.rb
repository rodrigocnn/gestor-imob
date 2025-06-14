require 'rails_helper'


RSpec.describe Neighborhood, type: :model do
  it 'Create a new Neighborhood ' do
    city = create(:city)
    neighborhood = create(:neighborhood, city: city)
    expect(neighborhood.name).to eq("Centro")
  end

  context "Validations" do
    it "does not allow name blank" do
      neighborhood = build(:neighborhood, name: "")
      expect(neighborhood).to_not be_valid
    end

    it "does not allow name with less than 3 characters" do
      neighborhood = build(:neighborhood, name: "AB")
      expect(neighborhood).to_not be_valid
    end

    it "should be associated with a valid city" do
       neighborhood = build(:neighborhood, city: nil)
      expect(neighborhood).to_not be_valid
    end

    it 'does not allow name duplicate' do
      city = create(:city)
      create(:neighborhood, city: city)
      neighborhood_duplicate = build(:neighborhood, city: city)
      expect(neighborhood_duplicate).to be_invalid
    end
  end
end
