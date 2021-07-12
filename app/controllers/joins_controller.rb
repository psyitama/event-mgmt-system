class JoinsController < ApplicationController
  def create
    event_to_join = Join.new(join_params)

    if event_to_join.save
      flash[:action_success] = "Join successfully."
    else
      flash[:errors] = "Failed to join."
    end
    redirect_to '/events'
  end

  def destroy
    event_to_cancel = Join.where(user_id: join_params[:user_id]).where(event_id: join_params[:event_id])

    if event_to_cancel.destroy
      flash[:action_success] = "Unjoin successfully."
    else
      flash[:action_error] = "Failed to unjoin"
    end
    redirect_to "/events"
  end

  private

  def join_params
    params.require(:join).permit(:event_id, :user_id)
  end
end
