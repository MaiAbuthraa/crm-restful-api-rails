# crm-restful-api-rails
Build CRM restful api, by using Rails 6 and PSQL (Experiment)

1- Use rack-cors

1.1- add the gem then `bundle install`
```
gem 'rack-cors'
```
1.2- Update file `config/initializers/cors.rb`
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

2- Devise
2.1- Install gem & follow the inststuctions
2.2- Create custom `FailureApp`
2.2.1-  add this config (config/initializers/devise.rb):
```
  config.warden do |manager|
    manager.failure_app = CustomDeviseFailureApp
  end
```
2.2.1- Create CustomDeviseFailureApp (lib/):
```
lib/custom_devise_failure_app.rb
```

3- Create 

5- Use 'simple_token_authentication' gem to generate `authentication token`
5.1-  add the gem then `bundle install`
```
gem 'simple_token_authentication', '~> 1.0'
```
5.2- `rails g migration add_authentication_token_to_users "authentication_token:string{30}:uniq"`
5.3- `rake db:migrate`




