class LineItemsController < ApplicationController
  before_filter :current_order

  def create
    @order = current_order
    product = Product.find(params[:product_id])
    @line_item = @order.add_product(product.id)
    if @line_item.save
      redirect_to store_path(product.store)
    else
      redirect_to order_path(@order)
    end
  end

  private

end
