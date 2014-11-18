class BookingsController < ApplicationController
  def create
    @flat = Flat.find(params[:flat_id])
    @booking = current_user.bookings.new(booking_params.merge(flat_id: @flat.id))

    if @booking.start_date>@booking.end_date
      flash.now[:alert] = "Start date can't be superior to end date"
      return render 'flats/show'
    end

    for date in @booking.start_date..@booking.end_date
      if (@flat.availabilities.find_by day: date).nil?
        flash.now[:alert] = "#{date} can't be booked"
        return render 'flats/show'
      else
        if (@flat.availabilities.find_by day: date).booking_id != nil
          flash.now[:alert] = "#{date} is already booked"
          return render 'flats/show'
        end
      end
    end

    if @booking.save
      for date in @booking.start_date..@booking.end_date
          availability = (@flat.availabilities.find_by day: date)
          availability.booking_id = @booking.id
          availability.save
      end
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


