class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @user_orders = current_user.orders
    render 'index.json.jb'
  end

  def show
    user_orders = current_user.orders
    @order = user_orders.find_by(id: params['id'])
    render json: { message: @order }
  end

  def create
    carted_products = CartedProduct.all.where(status: 'carted')
    @carted_product = carted_products.first

    # @order = Order.new(
    #   user_id: user_id,
    #   subtotal: price,
    #   tax: tax,
    #   total: total
    # )

    # @order.save

    # render json: { carted_products: 'hello world' }
    render json: { order: @carted_product }
  end

  def destroy
    if current_user
      user_orders = current_user.orders
      @order = user_orders.find_by(id: params['id'])
      @order.destroy
      render json: {order: @order}
    else
      render json: {message: 'please log in'}
    end
  end
end
