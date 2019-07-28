class ProductsController < ApplicationController
  def index
    @products = Product.all

    if params[:category]
      category = Category.find_by(name: params[:category])
      @product = category.products
    end

    render 'index.html.erb'
  end

  def show
    @product = Product.all.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    @suppliers = Supplier.all
    render 'new.html.erb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )

    if @product.save
      redirect_to "/products/#{@product.id}"
    else
      render 'errors.json.jb'
    end
  end

  def edit
    @product = Product.all.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to "/products"
  end
end
