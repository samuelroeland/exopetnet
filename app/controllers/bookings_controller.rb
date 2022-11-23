class BookingsController < ApplicationController
  #def new
    # @animal = Animal.find(params[:animal_id])
    # @booking = Booking.new
  #end

  def create
    # @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(booking_params)
    # @booking.animal = @animal
    # @booking.user = current_user
    raise
    if @booking.save
      redirect_to animals_path(@animal)
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:arrival_date, :end_date)
  end
end
