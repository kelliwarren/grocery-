require 'spec_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :phone }
    it { should validate_presence_of :email }
   
  end

describe 'associations' do
  it {should have_many :stores}
  end
end