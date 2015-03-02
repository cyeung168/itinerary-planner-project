class ItinerariesController < ApplicationController
  before_action :find_destination, :find_itinerary, only: [:edit, :show, :update, :destroy, :add_user, :remove_user]
  def index
<<<<<<< HEAD
    @user = session[:user_id]
    @itineraries = Itinerary.all 
    @destinations = Destination.all
  end

  def show
    @user = session[:user_id]
    @destinations = Destination.all - @itinerary.destinations
=======
    @user = User.find(session[:user_id])
    @itineraries = Itinerary.all
  end

  def show
    @users = User.all - @itinerary.users
    @destination_origin = Destination.find(params[:origin])
    @destination_destination = Destination.find(params[:destination])
>>>>>>> 8e8e94b84c5b1eb4b620589eae0d98f4c0263e44
    @comments = @itinerary.comments
  end

  def new
    @itinerary = Itinerary.new
    @destinations = Destination.all
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

  def add_destination
    destination = Destination.find(destination_params[:id])
    unless @itinerary.destinations.include? destination
      itinerary.origin = destination.name
    end
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

