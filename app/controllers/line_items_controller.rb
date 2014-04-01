class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.line_items.build(product: product)
    if @line_item.save
      redirect_to root_path
    else
      redirect_to store_path(product.store)
    end
  end
end
