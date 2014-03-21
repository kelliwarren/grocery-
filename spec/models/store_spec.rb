require 'spec_helper'

describe Store do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :street_address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :zip }
   
  end

describe 'associations' do
  it {should belong_to :user }
  end
end