class JoinsController < ApplicationController
  def create
    
  end

  private

  def join_params
    params.require(:join).permit(:event_id, :user_id)
  end
end
