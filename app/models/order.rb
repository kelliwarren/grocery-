class Order < ActiveRecord::Base
  has_and_belongs_to_many :products
  belongs_to :store
  belongs_to :user
end
