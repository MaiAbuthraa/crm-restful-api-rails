# crm-restful-api-rails
Build CRM restful api, by using Rails 6 and PSQL (Experiment)


1. Use rack-cors:

1. add the gem then `bundle install`
```
gem 'rack-cors'
```
2. Update file `config/initializers/cors.rb`
```
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```

2. Devise:

1. Install gem & follow the inststuctions.

2. Create custom `FailureApp`

1.  add this config (config/initializers/devise.rb):
```
  config.warden do |manager|
    manager.failure_app = CustomDeviseFailureApp
  end
```

2. Create CustomDeviseFailureApp (lib/custom_devise_failure_app.rb):
```
class CustomDeviseFailureApp < Devise::FailureApp
  def respond
    if request.controller_class.to_s.start_with? 'Api::'
      json_api_error_response
    else
      super
    end
  end

  def json_api_error_response
    self.status        = 401
    self.content_type  = 'application/json'
    self.response_body = { errors: [{ status: '401', title: i18n_message }]}.to_json
  end

  def http_auth_body
    return super unless request_format == :json

    {
      sucess: false,
      message: i18n_message
    }.to_json
  end
end
```

3. Update ApplicationController
```
class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  respond_to :json
  
  rescue_from NoMethodError, with: :no_method
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_record
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
  
  private
  def not_destroyed(e)
    render json: { errors: e }, status: :unprocessable_entity
  end

  def no_method(e)
    return render json: { errors: e }, status: :unprocessable_entity 
  end

  def not_found_record(e)
    return render json: { errors: e }, status: :not_found
  end
end

```

4. Then create `app/controllers/authentication_controller.rb`
```
class AuthenticationController < ApplicationController
  acts_as_token_authentication_handler_for User
end

```

5. Use 'simple_token_authentication' gem to generate `authentication token`:


1.  add the gem then `bundle install`
```
gem 'simple_token_authentication', '~> 1.0'
```

2. `rails g migration add_authentication_token_to_users "authentication_token:string{30}:uniq"`.



3. `rake db:migrate`




