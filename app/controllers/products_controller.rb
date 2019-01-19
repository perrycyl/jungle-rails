class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews_rating = Review.where(product_id: @product.id).average(:rating)
    @reviews = Review.where(product_id: @product_id)
  end

end
