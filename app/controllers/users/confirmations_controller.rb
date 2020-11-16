class Users::ConfirmationsController < Devise::ConfirmationsController

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      render json: {messages: [I18n.t('devise.confirmations.confirmed')]}, status: :ok
    else
      render json: {errors: resource.errors},  status: :unprocessable_entity
    end
  end
end
