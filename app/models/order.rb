class Order < ActiveRecord::Base
  has_and_belongs_to_many :products
  belongs_to :user
  belongs_to :store
end
