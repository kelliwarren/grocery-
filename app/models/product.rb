class Product < ActiveRecord::Base

  validates :name, :description, :quantity, :store_id, :image, :price, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  # validates :name, :uniqueness => true
  validates :image, :format => {
    :with    => %r{\.(gif|jpg|png)\Z}i,
  :message => 'must be a URL for GIF, JPG or PNG image.' }
  belongs_to :store
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      true
    else
      errors.add(:base, 'line item present')
      false
    end
  end
end
