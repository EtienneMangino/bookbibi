class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @city = params[:city]
    @start_date = params[:start_date]
    @end_date = params[:end_date]

    if @city != ""
      flats_city = Flat.where(city: @city)
    else
      flats_city = Flat.all
    end

    @flats = flats_city.select do |flat|
      available = true
      (@start_date..@end_date).each do |date|
        if flat.availabilities.find_by(day: date) != nil
          available = false if flat.availabilities.find_by(day: date).booking.present?
        else
          available = false
        end
      end
      flat if available
    end

  end

  def show
    @booking = Booking.new
  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def create
    @flat = current_user.flats.new(flat_params)
    if @flat.save
      flash[:notice] = "Your new flat in #{@flat.city} has been added successfully!"
      redirect_to manage_all_flats_path
    else
      render :new
    end
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
  end


  private
    def set_flat
      @flat = Flat.find(params[:id])
    end

    def flat_params
      params.require(:flat).permit(:title, :address, :city, :description, :picture)
    end
end

