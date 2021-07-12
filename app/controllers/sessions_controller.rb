class SessionsController < ApplicationController

  def create
    user = User.find_by_email(user_params[:email]).try(:authenticate, user_params[:password]) 
    if user
        session[:user_id] = user.id
        redirect_to "/events"
    else
        flash[:errors] = ["Invalid Combination"]
        redirect_to '/'
    end
  end

  def destroy
      session[:user_id] = nil
      redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
