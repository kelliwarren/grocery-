class Product < ActiveRecord::Base

  validates :name, :description, :quantity, :store_id, :image, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
 # validates :name, :uniqueness => true
  validates :image, :format => {
    :with    => %r{\.(gif|jpg|png)\Z}i,
  :message => 'must be a URL for GIF, JPG or PNG image.' }

  belongs_to :store
 
end
