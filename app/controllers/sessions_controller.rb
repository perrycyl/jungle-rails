class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
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
