class BookingsController < ApplicationController


  def create
    @trip = Trip.find(params[:trip_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.trip = @trip
    if @booking.save!
      redirect_to dashboard_path
    else
      render 'bookings/new_booking'
    end
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.user = current_user
    @booking.trip = @trip
    @booking.destroy
    redirect_to dashboard_path
  end

  def show
    @booking = Booking.find(params[:id])
    @review = Review.new
  end

  private

  def booking_params
    params.require(:booking).permit(:begin_date, :end_date)
  end
end
