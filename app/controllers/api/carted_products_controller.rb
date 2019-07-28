class Api::CartedProductsController < ApplicationController
  def index
    user_id = 43
    @users_carted_products = CartedProduct.all.where(user_id: user_id)
    render 'index.json.jb'
  end

  def create
    user_id = 43
    product_id = params[:product_id]
    order_id = 1
    quantity = params[:quantity]

    @carted_product = CartedProduct.new(
      user_id: user_id,
      product_id: product_id,
      order_id: order_id,
      status: 'carted',
      quantity: quantity
    )

    if @carted_product.save
      render 'create.json.jb'
    else
      render json: { message: @carted_product.errors }
    end
  end
end


  # create_table "carted_products", force: :cascade do |t|
  #   t.integer "user_id"
  #   t.integer "product_id"
  #   t.integer "order_id"
  #   t.datetime "created_at", precision: 6, null: false
  #   t.datetime "updated_at", precision: 6, null: false
  #   t.string "status"
  #   t.integer "quantity"
  # end