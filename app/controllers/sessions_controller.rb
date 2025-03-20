class SessionsController < ApplicationController
  def new
    # Render the login form (e.g., 'login.html.erb')
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])  # Assuming you're using has_secure_password
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully."
  end
end
