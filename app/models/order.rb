class Order < ActiveRecord::Base
  has_and_belongs_to_many :products
<<<<<<< HEAD
  belongs_to :store
  belongs_to :user
=======
  belongs_to :user
  belongs_to :store
>>>>>>> abf23a8a8ec88d5b85ba0b3827453b0a087b114f
end
