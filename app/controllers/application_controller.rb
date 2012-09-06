class ApplicationController < ActionController::Base
  protect_from_forgery

  control_and_rescue_traffic
  respond_to :json
end
