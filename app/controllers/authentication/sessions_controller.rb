class Authentication::SessionsController < Devise::SessionsController
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render json: {messages: [I18n.t('devise.sessions.signed_out')]} if signed_out
    yield if block_given?
  end
end
