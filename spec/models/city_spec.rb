require 'rails_helper'

RSpec.describe City, type: :model do
  it 'Create a City' do
    city = create(:city)
    expect(city.name).to eq("Barreiras")
  end

  context "Validations" do
    it "não permite nome em branco" do
      city = build(:city, name: "")
      expect(city).to_not be_valid
    end

    it "não permite nome com menos de 3 caracteres" do
      city = build(:city, name: "AB")
      expect(city).to_not be_valid
    end
  end
end
