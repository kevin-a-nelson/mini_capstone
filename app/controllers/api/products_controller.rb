class Api::ProductsController < ApplicationController
  def product
    @product = Product.first
    render 'product.json.jb'
  end
end
