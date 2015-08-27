class StorefrontController < ApplicationController
  def index
    if params[:cat_id]
      @category = Category.find(params[:cat_id])
      @products = Product.where(category_id: params[:cat_id]).order(:name)
    else
    @products = Product.order(:name).all
    end
  end
end
