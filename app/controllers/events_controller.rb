class EventsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def index
    @events = current_user.events
    respond_with @events
  end

  def show
    @event = current_user.events.find(params[:id])
    Rails.logger.info("*** Event occasions: #{@event.occasions.inspect}")
  end
  
  def create
    event = current_user.events.build(params[:event])
    event.save!
    respond_with(event) do |format|
      format.html { redirect_to events_path }
    end
  end
  
  def edit
    @events = current_user.events
    @event = @events.find(params[:id])
    render 'index'
  end
  
  def update
    event = current_user.events.find(params[:id])
    event.update_attributes!(params[:event])
    respond_with(event) do |format|
      format.html { redirect_to events_path }
    end
  end
  
  def destroy
    event = current_user.events.find(params[:id])
    event.destroy
    respond_with(event) do |format|
      format.html { redirect_to events_path }
      format.json { render :ok }
    end
  end

end
