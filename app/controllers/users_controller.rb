class UsersController < ApplicationController
    def new
        @user = User.new
    end
      
    def create
        puts "users params output: #{user_params}"
        user = User.new(user_params)
        if user.save
        session[:user_id] = user.id
        flash[:notice] = "Thank you for signing up! Enjoy shopping on Jungle." 
        redirect_to [:products]
        else
        flash[:notice] = "Email already exisits. Please try login"
        redirect_to'/login'
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end      
end
