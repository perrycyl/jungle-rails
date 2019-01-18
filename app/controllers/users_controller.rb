class UsersController < ApplicationController
    def new
        @user = User.new
    end
      
    def create
        puts "users params output: #{user_params}"
        user = User.new(user_params)
        if user.save!
        session[:user_id] = user.id
        redirect_to [:products], notice: "Thank you for signing up!"
        else
        redirect_to'/signup'
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end      
end
