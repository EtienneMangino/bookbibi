class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @flats = Flat.all
    respond_with(@flats)
  end

  def show
    @booking = Booking.new
    respond_with(@flat)
  end

  def new
    @flat = Flat.new
    respond_with(@flat)
  end

  def edit
  end

  def create
    @flat = current_user.flats.new(flat_params)
    @flat.save
    (0..90).each do |i|
      date = Date.today+i
      @availability = @flat.availabilities.new(day:date)
      @availability.save
    end

    redirect_to manage_all_flats_path
  end

  def update
    @flat.update(flat_params)
    redirect_to manage_all_flats_path
  end

  def destroy
    @flat.destroy
    redirect_to manage_all_flats_path
  end

  def manage_all
    @flats = current_user.flats.all
    respond_with(@flats)
  end


  private
    def set_flat
      @flat = Flat.find(params[:id])
    end

    def flat_params
      params.require(:flat).permit(:title, :address, :city, :description, :picture)
    end
end
