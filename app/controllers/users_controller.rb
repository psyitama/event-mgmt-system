class UsersController < ApplicationController
  
  layout "two_column", only: [:index]

  def index
    @states = State.all
  end

  def show

  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:success] = "User successfully created."
    else
      flash[:errors] = user.errors.full_messages
    end
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :location, :state_id)
  end
end
