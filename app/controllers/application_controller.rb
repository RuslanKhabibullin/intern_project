class ApplicationController < ActionController::Base
  responders :flash
  respond_to :html

  include Authorization

  protect_from_forgery with: :exception
end
