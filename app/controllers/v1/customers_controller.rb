class V1::CustomersController < V1::AuthenticationController
  before_action :set_customer, only: [:show, :update, :destroy]

  def index
    @customers = Customer.includes(:created_by)

    render :index, status: :ok
  end

  def show
    render :show, status: :ok
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render :create, status: :created, location: v1_url([@customer])
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      render :update, status: :ok
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @customer.destroy
      head(:no_content)
    else
      head(:unprocessable_entity)
    end
  end

  private
    def set_customer
      @customer ||= Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer)
        .permit(:name, :company_name, :category, :active)
        .merge(
          created_by: current_user
        )
    end
end
