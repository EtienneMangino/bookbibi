class BookingsController < ApplicationController
  def create
    @flat = Flat.find(params[:flat_id])
    @booking = current_user.bookings.new(booking_params.merge(flat_id: @flat.id))

    if @booking.save
      redirect_to @flat, notice: 'Booking was successfully created.'
    else
      render 'flats/show'
    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:start_date, :end_date)
    end
end


