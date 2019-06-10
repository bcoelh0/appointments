class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # devise method monkeypatch to redirect users to the correct path after sign in
  def after_sign_in_path_for(resource)
  	stored_location_for(resource) || appointments_path
  end
end
