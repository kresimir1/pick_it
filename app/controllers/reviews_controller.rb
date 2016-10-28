class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews
  end

  def show
  @review = Review.find(params[:id])
  @product = @review.product
  end

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def edit
     @product = Product.find(params[:product_id])
     @review = @product.reviews.find(params[:id])
  end


  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product = @product
    @review.user_id = current_user.id
    @review.username = current_user.first_name


    if @review.save
      flash[:notice] = "Review saved successfully."
      redirect_to product_path(@product)
    else
      flash[:alert] = "Failed to save review."
      render :new
    end
  end

  def update
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])

    if @review.update(review_params)
      redirect_to product_path(@product), notice: "Successfully edited review information."
    else
      render 'edit'
    end
  end

  def destroy
   @product = Product.find(params[:product_id])
   @review = @product.reviews.find(params[:id])
   @review.destroy
   redirect_to product_path(@product), notice: "Successfully deleted the review."
  end


  def review_params
    params.require(:review).permit(:title, :username, :content)
  end
end
