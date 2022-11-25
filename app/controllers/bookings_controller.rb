class BookingsController < ApplicationController
  def create
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(booking_params)
    @booking.animal = @animal
    @booking.user = current_user
    authorize @booking

    if @booking.save
      redirect_to my_bookings_path
    else
      render "animals/show", status: :unprocessable_entity
    end
  end

  private

  def set_animal
    @animal = Animal.find(params)
  end

  def booking_params
    params.require(:booking).permit(:arrival_date, :end_date)
  end
end
