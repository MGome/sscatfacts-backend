require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Associations' do
    it { should belongs_to(:cat_facts) }
    it { should belongs_to(:users) }
  end
end
