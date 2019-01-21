class SessionsController < ApplicationController
  def new
  end

  def create

    if user = User.authenticate_with_credentials(params[:password], params[:email])
      session[:user_id] = user.id
      flash[:notice] = "Login Successful."
      redirect_to '/'
    puts "Inside create"
    else
      flash[:notice] = "Email or password is invalid"
      render "new"
    puts "failed login"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: "Logged out!"
  end
end
