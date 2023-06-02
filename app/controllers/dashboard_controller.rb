class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    flash_message(
      :success,
      "Welcome to Rails Starter!",
      "Hope that this starter template gets your project up and running in no time.", now: true
    )

    flash.now[:notice] = "This is an notice message."
    flash.now[:success] = "This is an alert message."
    flash.now[:error] = "This is an error message."
  end
end