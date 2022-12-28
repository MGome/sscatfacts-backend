require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Attributes' do
    it { should respond_to :username }
  end

  describe 'Associations' do
    it { should have_many(:cat_facts).through(:likes) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  describe 'Validations' do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of(:username) }
  end
end
