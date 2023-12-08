class HomesController < ApplicationController
  def index
    render json: {message: "Welcome to our Application"}
  end
end
