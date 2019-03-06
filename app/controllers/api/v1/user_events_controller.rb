class Api::V1::UserEventsController < ApplicationController
    before_action :find_user_event, only: [:update,  :destroy]
  def index
    @user_events = UserEvent.all
    render json: @user_events
  end

  def update
    @user_event.update(user_event_params)
    if @user_event.save
      render json: @user_event, status: :accepted
    else
      render json: { errors: @user_event.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def create 
    @user_event = UserEvent.create(user_event_params)
  end

  def destroy 
    @user_event.delete
  end

  private

  def user_event_params
    params.permit(:event_id, :user_id )
  end

  def find_user_event
    @user_event = UserEvent.find(params[:id])
  end
end
