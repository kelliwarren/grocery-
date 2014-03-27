require 'spec_helper'

describe Order do
  describe 'associations' do
    it {should belong_to :store }
    it {should belong_to :user }
    it {should have_and_belong_to_many :products}
  end
end