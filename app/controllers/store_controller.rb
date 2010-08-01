class StoreController < ApplicationController

  def index
    @products = Product.find_products_for_sale
  end

  def find_cart
    session[:cart] ||= Cart.new
  end

end
