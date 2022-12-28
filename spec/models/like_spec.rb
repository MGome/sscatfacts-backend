require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Associations' do
    it { should belong_to(:cat_fact) }
    it { should belong_to(:user) }
  end
end
