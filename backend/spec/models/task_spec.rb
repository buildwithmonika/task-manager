require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it 'is valid with a title and description' do
      task = FactoryBot.build(:task)
      expect(task).to be_valid
    end

    it 'is invalid without a title' do
      task = FactoryBot.build(:task, title: nil)
      expect(task).not_to be_valid
      expect(task.errors[:title]).to include("can't be blank")
    end

    it 'is invalid with a title longer than 200 characters' do
      long_title = 'a' * 201
      task = FactoryBot.build(:task, title: long_title)
      expect(task).not_to be_valid
      expect(task.errors[:title]).to include("is too long (maximum is 200 characters)")
    end

    it 'is invalid with a description longer than 1000 characters' do
      long_description = 'a' * 1001
      task = FactoryBot.build(:task, description: long_description)
      expect(task).not_to be_valid
      expect(task.errors[:description]).to include("is too long (maximum is 1000 characters)")
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      assoc = Task.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
