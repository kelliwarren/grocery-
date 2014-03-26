require 'spec_helper'

describe Product do
  pending "add some examples to (or delete) #{__FILE__}"
end



  validates :name, :description, :quantity, :store_id, :image, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
 # validates :name, :uniqueness => true
  validates :image, :format => {
    :with    => %r{\.(gif|jpg|png)\Z}i,
  :message => 'must be a URL for GIF, JPG or PNG image.' }

  belongs_to :store
 


require 'spec_helper'

describe Store do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :store_id }
    it { should validate_presence_of :street_address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :zip }

  end

describe 'associations' do
  it {should belong_to :user }
  end
end