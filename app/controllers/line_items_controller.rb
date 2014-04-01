class LineItemsController < ApplicationController
  def create
    @order = current_order
    product = Product.find(params[:product_id])
    @line_item = @order.line_items.build(product: product)
    if @line_item.save
      redirect_to order_path(@order)
    else
      redirect_to store_path(product.store)
    end
  end
end
