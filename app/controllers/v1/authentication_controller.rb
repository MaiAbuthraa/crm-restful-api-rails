class V1::AuthenticationController < V1::ApplicationController
  acts_as_token_authentication_handler_for User
end
