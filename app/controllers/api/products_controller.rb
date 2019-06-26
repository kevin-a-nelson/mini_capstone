class Api::ProductsController < ApplicationController
  def product
    @product = Product.first
    render 'product.json.jb'
  end

  def all_products
    @products = Product.all
    render 'all_products.json.jb'
  end
end
