class ReviewsController < ApplicationController
  before_filter :authorize
  
  
    def create
      @product = Product.find(params[:product_id])      
      @review = @product.reviews.new(review_params)
      @review.user_id = current_user.id

      if @review.save
        redirect_to @product, notice: "Review Saved!"
      else
        render 'products/show'
      end

    end
  
    def destroy
      @cur_product = Product.find(params[:product_id])
      @review = @cur_product.reviews.find(params[:id])
      @review.destroy
      redirect_to product_path(@cur_product)
    end
    
    private
  
      def review_params
        params.require(:review).permit(
          :rating,
          :description
        )
      end
      
end
