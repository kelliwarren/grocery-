class Product < ActiveRecord::Base

  validates :name, :description, :quantity, :store_id, :image, :price, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
 # validates :name, :uniqueness => true
  validates :image, :format => {
    :with    => %r{\.(gif|jpg|png)\Z}i,
  :message => 'must be a URL for GIF, JPG or PNG image.' }

  belongs_to :store
<<<<<<< HEAD
  has_and_belongs_to_many :orders
 
=======
 has_and_belongs_to_many :orders
>>>>>>> abf23a8a8ec88d5b85ba0b3827453b0a087b114f
end
