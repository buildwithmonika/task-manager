require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with a name, email, and password' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = FactoryBot.build(:user, name: nil)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without an email' do
      user = FactoryBot.build(:user, email: nil)
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a password' do
      user = FactoryBot.build(:user, password: nil)
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it 'has many tasks' do
      assoc = User.reflect_on_association(:tasks)
      expect(assoc.macro).to eq :has_many
    end
  end
end
