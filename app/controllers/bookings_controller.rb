class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @flat = Flat.find(params[:flat_id])
    @booking.user = current_user
    @booking.flat = @flat

    # parameters conversion
    date_format = "%Y-%m-%d"
    @booking.checkin_date = Date.strptime(params[:booking][:checkin_date], date_format)
    @booking.checkout_date = Date.strptime(params[:booking][:checkout_date], date_format)
    @booking.guests = params[:booking][:guests].to_i
    @booking.price_per_night = params[:booking][:price_per_night].to_f
    @booking.price_in_total = params[:booking][:price_in_total].to_f

    if @booking.save
      redirect_to booking_list_path, notice: "booking done!"
    else
      render flat_path(@flat), status: :unprocessable_entity
    end

  end

  def list
    @bookings = Booking.where(user_id: current_user.id).order(checkin_date: :asc)
  end

  private

  def booking_params
    params.require(:booking).permit(:checkin_date, :checkout_date, :price_per_night, :price_in_total, :flat_id, :guests)
  end

end
