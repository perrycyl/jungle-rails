class ReviewsController < ApplicationController
    
    
    def create
        @user = current_user
        @params = params.require(:review).permit(:description, :rating)
        @products = Review.create(product_id: params[:product_id], user_id: @user.id, rating:review_params[:rating], description: review_params[:description])
        if @products.save
        puts 'SUCCESS IN CREATING RECORD'
        else
        puts 'FAILED TO CREATE RECORD'
        end
    end

    private

    def review_params
        params.require(:review).permit(:rating, :description)
    end

end
