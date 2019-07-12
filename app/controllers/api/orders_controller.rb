class Api::OrdersController < ApplicationController
  def index
    if current_user
      @user_orders = current_user.orders
      render json: {user_orders: @user_orders }
    else
      render json: { message: 'please log in' }
    end
  end

  def show
    if current_user
      user_orders = current_user.orders
      @order = user_orders.find_by(id: params['id'])
      render json: { message: @order }
    else
      render json: { message: 'please log in'}
    end
  end

  def create
    if current_user
      product = Product.find_by(name: params['product_name'])
      quanitity = params['quanitity'].to_i
      price = product.price.to_i
      total = price * quanitity
      tax = product.tax * quanitity

      @order = Order.new(
        user_id: current_user.id,
        product_id: product.id,
        subtotal: price,
        tax: tax,
        total: total,
        quantity: quanitity
      )

      @order.save

      render json: { order: @order }
    else
      render json: { message: 'please log in' }
    end
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
