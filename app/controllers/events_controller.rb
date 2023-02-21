class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  def index
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(post_params)
    @event.user_id = current_user.id
    @event.save
    redirect_to events_path
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:event).permit(:title, :start_date, :duration, :description, :price, :location)
  end

end