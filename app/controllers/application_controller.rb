class ApplicationController < ActionController::Base
  responders :flash
  respond_to :html

  protect_from_forgery with: :exception

  include Authentication
  include Authorization
  include Internationalization
end
