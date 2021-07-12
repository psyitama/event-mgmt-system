class UsersController < ApplicationController
  
  layout "two_column", only: [:index]
  skip_before_action :require_login, except: [:index]

  def index
    @states = State.all
  end

  def edit
    @states = State.all
  end

  def update
    user_to_update = User.find(params[:id])

    if user_to_update.update(user_params)
      flash[:success] = "User successfully updated."
    else
      flash[:errors] = user_to_update.errors.full_messages
    end
    redirect_to "/users/#{params[:id]}/edit"
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
