class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update]

  def index
    # if params[:search]
    #   @products = Product.where('name LIKE ?', "%#{params[:search]}%")
    # else
    #   @products = Product.all
    # end

    # if params[:discount]
    #   @products = @products.where("price > ?", 10)
    # end

    # if params[:sort] && params[:sort_order]
    #   @products = @products.order(params[:sort] => params[:sort_order])
    # else
    #   @products = @products.order(:id => :asc)
    # end
    #
    #
    @products = Product.all

    if params[:category]
      category = Category.find_by(name: params[:category])
      @product = category.products
    end

    render 'product.html.erb'
    # render 'index.json.jb'
  end

  def show
    @product = Product.all.find_by(id: params['id'])
    render 'show.json.jb'
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      description: params[:description] || @product.description
    )
      render 'show.json.jb'
    else
      render 'errors.json.jb', status: :unprocessible_entity
    end
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )
    if @product.save
      render 'show.json.jb'
    else
      render 'errors.json.jb', status: :unprocessible_entity
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render 'show.json.jb'
  end

  # def new
  #   render 'new.html.erb'
  # end
end
