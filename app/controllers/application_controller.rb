class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include GlobalRescueHandlers

  respond_to :json
end
