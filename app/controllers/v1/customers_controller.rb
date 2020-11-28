class V1::CustomersController < V1::AuthenticationController
  def index
    @customers = Customer.includes(:created_by)

    render :index, status: :ok
  end
end
