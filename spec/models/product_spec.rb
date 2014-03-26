
require 'spec_helper'

describe Product do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :store_id }
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :image }
    it { should validate_presence_of :price }
  

  end

describe 'associations' do
  it {should belong_to :store }
  end
end