require 'rails_helper'

describe User do
  let(:user1) { User.new(first_name:"Rose Anne", last_name:"Concepcion", email:"roan@proudcloud.net" ) }

  describe "#validations" do
    it 'validates presence of first name' do
      expect(user1.first_name).not_to be_empty
    end

    it 'validates presence of last name' do
      expect(user1.last_name).not_to be_empty
    end

    it 'validates the uniqueness of email' do
      user1.save
      user2 = User.new(first_name:"Sam", last_name:"Cruz", email:"roan@proudcloud.net")
      expect(user2.valid?).to eq false

      #expect(user2.errors[:email]).to include "has already been taken" 
    end
  end
  
  describe ".full_name" do
    it "returns the full name of the user" do
      expect(user1.full_name).to eq "Rose Anne Concepcion"
    end
  end
end


