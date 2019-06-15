class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      @appointments = current_user.appointments
    end
  end
end
