class ItinerariesController < ApplicationController
  before_action :find_destination, :find_itinerary, only: [:edit, :show, :update, :destroy, :add_user, :remove_user]
  def index
    @user = session[:user_id]
    @itineraries = Itinerary.all 
    @destinations = Destination.all
  end

  def show
    @user = session[:user_id]
    @destinations = Destination.all - @itinerary.destinations
    @comments = @itinerary.comments
  end

  def new
    @itinerary = Itinerary.new
  end

  def edit
  end

  def create
    @itinerary = Itinerary.create itinerary_params
    @destination = Destination.find(params[:destination_id])
    @user.itineraries << @itinerary
    redirect_to @itinerary
  end

  def update
    @itinerary.update_attributes itinerary_params
    redirect_to @itinerary
  end

  def destroy
    @itinerary.destroy
    redirect_to itinerary_path
  end

  def add_user
    @itinerary = Itinerary.find(params[:id])
    @user = User.find(params[:user_id])
    @destination = Destination.find(params[:destination_id])
    unless @itinerary.users.include? user
      @itinerary.users << user
      @destination.users << user
    else
      redirect_to @itinerary
    end
  end

  def add_destination
    @itinerary = Itinerary.find(params[:id])
    @user = User.find(params[:user_id])
    @destination = Destination.find(params[:destination_id])
    unless @itinerary.destinations.include? destination
      @itinerary.destinations << destination
      @user.destinations << destination
    else
      redirect_to @itinerary
    end
  end

  def remove_user
    user = User.find(params[:user_id])
    @itinerary.users.delete(user)
    redirect_to @itinerary
  end

  private
 def destination_params
   params.require(:destination).permit(:id, :location, :name, :info)
 end

 def itinerary_params
   params.require(:itinerary).permit(:id, :origin, :destination, :name, :depart_date, :return_date)
 end

 def find_destination
   @destination = Destination.find(params[:id])
 end

 def find_itinerary
   @itinerary = Itinerary.find(params[:id])
 end
end

