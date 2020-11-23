class Users::ConfirmationsController < Devise::ConfirmationsController
  before_action :set_resource, only: [:create]

  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, :location => after_resending_confirmation_instructions_path_for(resource_name))
    else
      respond_with(resource)
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

  protected
  # The path used after resending confirmation instructions.
  def after_resending_confirmation_instructions_path_for(resource_name)
    root_path
  end

  private
  def set_resource

  end
end
