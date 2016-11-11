class ApplicationController < ActionController::Base
  responders :flash
  respond_to :html

  include Authorization
  include Authentication

  protect_from_forgery with: :exception
end
