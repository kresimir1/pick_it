class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]

  def index
    @products = Product.all
  end

  def show
     @product = Product.find(params[:id])
     @reviews = @product.reviews
     @users = User.all


  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id

     if @product.save
       redirect_to @product, notice: "Successfully added product."
     else
       render 'new'
     end
   end

   def update
     @product = Product.find(params[:id])

     if @product.update(product_params)
       redirect_to @product, notice: "Successfully edited product information."
     else
       render 'edit'
     end
   end

   def destroy
     @product = Product.find(params[:id])
     @product.destroy

     redirect_to products_path
   end

   private
     def product_params
       params.require(:product).permit(:name, :description, :image_url)
     end

     def authorize_user
      if !user_signed_in? || !current_user.admin?
        raise ActionController::RoutingError.new("Not Found")
      end
    end


end
