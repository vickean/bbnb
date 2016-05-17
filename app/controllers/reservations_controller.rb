class ReservationsController < ApplicationController

  def new
    @listing_id = params[:listing_id]
    @reservation = Reservation.new
  end

  def index
    @reservations = Reservation.all
  end

  def create
    byebug
  end

end
