module GlobalRescueHandlers
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: { errors: exception }, status: :not_found
    end

    rescue_from ActiveRecord::RecordNotDestroyed, NoMethodError do |exception|
      render json: { errors: exception }, status: :unprocessable_entity
    end

    rescue_from ActiveRecord::InvalidForeignKey do |exception|
      render json: { errors: exception }, status: :failed_dependency
    end

    rescue_from CanCan::AccessDenied do |exception|
      render json: { errors: exception}, status: :forbidden
    end
  end
end
