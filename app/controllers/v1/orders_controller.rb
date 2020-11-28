class V1::OrdersController < V1::AuthenticationController
  # no need for this, only try expose in my code
  expose :orders, -> { @customer.orders }

  before_action :set_customer
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = orders.includes(:created_by)

    render :index, status: :ok
  end

  def show
    render :show, status: :ok
  end

  def create
    @order = @customer.orders.new(order_params)

    if @order.save
      render :create, status: :created, location: v1_url([@customer, @order])
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render :update, status: :ok
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @order.destroy
      head(:no_content)
    else
      head(:unprocessable_entity)
    end
  end

  private
    def set_order
      @order = @customer.orders.find(params[:id])
    end

    def set_customer
      @customer ||= Customer.find(params[:customer_id].to_i)
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order)
        .permit(:description, :active, :status)
        .merge(
          created_by: current_user
        )
    end
end
