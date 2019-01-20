class ReviewsController < ApplicationController
        
    before_action :deny_access, :unless => :logged_in

    def create
        @user = current_user
        @products = Review.create(product_id: params[:product_id], user_id: @user.id, rating:review_params[:rating], description: review_params[:description])
        if @products.save
        puts 'SUCCESS IN CREATING RECORD'
        else
        puts 'FAILED TO CREATE RECORD'
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to 'http://localhost:3000/products'
    end

    private

    def review_params
        params.require(:review).permit(:rating, :description)
    end

    def logged_in
        current_user.present?
    end

end
