class DestinationsController < ApplicationController
before_action :find_destination, :find_itinerary, only: [:edit, :show, :update, :destroy, :add_user, :remove_user]


  def index
    @destinations = Destination.all
  end

  def show
    @users= User.all - @destination.users
  end

  def new
    @destination = Destination.new
  end

  def edit
  end

  def create
    @destination = Destination.create destination_params
    @itinerary = Itinerary.find(params[:itinerary_id])
    @itinerary.destinations << @destination

    redirect_to @itinerary
  end

  def update
    @destination.update_attributes destination_params
    redirect_to @itinerary
  end

  def destroy
    @destination.destroy
    redirect_to @itinerary
  end

  def add_user
    @destination = Destination.find(params[:id])
    @user = User.find(params[:user_id])
    @itinerary = Itinerary.find(params[:itinerary_id])
    unless @destination.users.include? user
      @destination.users << user
      @itinerary.users << user
    else
      redirect_to @destination
    end
  end

  def remove_user
    user = User.find(params[:user_id])
    @destination.users.delete(user)
    redirect_to @destination
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
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  #   def find_user
  #   @user = User.find(params[:itinerary_id])
  # end
end
