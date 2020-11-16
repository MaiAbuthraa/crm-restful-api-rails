class Users::SessionsController < Devise::SessionsController
  def create
    super { |resource| @resource = resource }
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render json: {messages: [I18n.t('devise.sessions.signed_out')]} if signed_out
    yield if block_given?
  end

  def after_sign_up_path_for(_resource)
    render json: {messages: [I18n.t('devise.sessions.signed_out')]}
  end
end
