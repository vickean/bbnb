class ListingsController < ApplicationController

  before_action :find_listing, only: [:show, :edit, :update]

  def index
    @listings = Listing.all
  end

  def new
  end

  def create
    @listing = current_user.listings.new(user_params)

    if @listing.save
      redirect_to user_listing_path(current_user, @listing)
    else
      flash.now[:warning] = 'y u do dis'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @listing.update(user_params)
      flash[:success] = 'yay'
      redirect_to user_listing_path(current_user, @listing)
    else
      flash.now[:warning] = 'y u do dis'
      render :edit
    end
  end

  def destroy
    Listing.find(params[:id]).destroy
    flash[:success] = 'deleted'
    redirect_to root_path
  end

  private

  def find_listing
    @listing = Listing.find(params[:id])
  end

   def user_params
     params.require(:listing).permit(:address, :city)
   end
end
