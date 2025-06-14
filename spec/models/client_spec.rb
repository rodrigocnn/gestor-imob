require 'rails_helper'

RSpec.describe Client, type: :model do
    context "CRUD" do
    it 'Create a new Client' do
      client = create(:client)
      expect(client.name).to eq("Carlos Nunes")
      expect(client.email).to eq("carlos@example.com")
      expect(client.cpf).to eq("807.527.798-76")
      expect(client.phone).to eq("(77) 9049-4009")
    end
  end

  context "Validations" do
    it "does not allow blank name" do
      client = build(:client, name: "")
      expect(client).to_not be_valid
    end

    it "does not allow name with less than 3 characters" do
      client = build(:client, name: "AB")
      expect(client).to_not be_valid
    end

    it "does not allow blank email" do
      client = build(:client, email: "")
      expect(client).to_not be_valid
    end

   it "does not allow incorrect format email" do
      client = build(:client, email: "carlos.com")
      expect(client).to_not be_valid
    end

   it "does not allow duplicate email" do
      create(:client)
      client_duplicate = build(:client, email: "carlos@example.com")
      expect(client_duplicate).to be_invalid
    end

    it "does not allow blank cpf" do
      client = build(:client, cpf: "")
      expect(client).to_not be_valid
    end

   it "does not allow duplicate cpf" do
      create(:client)
      cpf_duplicate = build(:client, cpf: "807.527.798-76")
      expect(cpf_duplicate).to be_invalid
    end

    it "does not allow incorrect format cpf" do
      client = build(:client, cpf: "80752779876")
      expect(client).to_not be_valid
    end


    it "does not allow blank phone" do
      client = build(:client, phone: "")
      expect(client).to_not be_valid
    end

    it "does not allow incorrect format phone" do
      client = build(:client, phone: "9049-4009")
      expect(client).to_not be_valid
    end
  end
end
