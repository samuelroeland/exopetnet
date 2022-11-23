class BookingsController < ApplicationController
  def new
    # @animal = Animal.find(params[:animal_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id

    if @booking.save
      redirect_to animals_path(@animal)
    else
      raise
      redirect_to root_path
    end
  end

  private

  def set_animal
    @animal = Animal.find(params)
  end

  def booking_params
    params.require(:booking).permit(:arrival_date, :end_date, :animal_id)
  end
end
