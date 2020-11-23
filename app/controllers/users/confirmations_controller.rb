class Users::ConfirmationsController < Devise::ConfirmationsController
  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      render json: {messages: [I18n.t('devise.confirmations.send_instructions')]}, status: :created
    else
      render json: {errors: resource.errors}, status: :unprocessable_entity
    end
  end

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
