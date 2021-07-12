class EventsController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @states = State.all
    @user_state_events = Event.where(state_id: current_user.state_id)
    @other_state_events = Event.where.not(state_id: current_user.state_id)
  end

  def show
    @selected_event = Event.find(params[:id])
    @users_joined = Join.where(event_id: params[:id])
    @event_comments = Comment.where(event_id: params[:id])
  end

  def create
    event = Event.new(event_params)

    if event.save
      flash[:success] = "Event successfully created."
    else
      flash[:errors] = event.errors.full_messages
    end
    redirect_to '/events'
  end

  def edit
    @event_to_edit = Event.find(params[:id])
    @states = State.all
  end

  def update
    event_to_update = Event.find(params[:id])

    if event_to_update.update(event_params)
      flash[:success] = "Event successfully updated."
    else
      flash[:error] = "Failed updating event."
    end
    redirect_to "/events/#{params[:id]}/edit"
  end

  def destroy
    event_to_delete = Event.find(params[:id])

    if event_to_delete.destroy
      flash[:action_success] = "Event successfully deleted."
    else
      flash[:action_error] = "Failed deleting event."
    end
    redirect_to "/events"
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :state_id, :user_id)
  end
end
