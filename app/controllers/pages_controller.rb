class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def my_bookings
    @bookings = current_user.bookings
  end
end
