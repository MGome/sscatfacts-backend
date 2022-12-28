require 'rails_helper'

RSpec.describe CatFact, type: :model do
  describe 'Attributes' do
    it { should respond_to :description }
  end

  describe 'Associations' do
    it { should have_many(:users).through(:likes) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  describe 'Validations' do
    it { should validate_presence_of :description }
    it { should validate_uniqueness_of(:description) }
  end
end
