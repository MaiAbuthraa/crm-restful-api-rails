class Users::SessionsController < Devise::SessionsController
  def create
    super do |resource| 
      resource.save if resource.authentication_token.nil?
    end
  end

  def destroy
    remove_current_users_token

    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render json: {messages: [I18n.t('devise.sessions.signed_out')]} if signed_out
    yield if block_given?
  end

  def remove_current_users_token
    if current_user
      current_user.authentication_token = nil
      current_user.save
    end
  end
end
