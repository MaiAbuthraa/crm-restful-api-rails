class V1::ContactsController < V1::AuthenticationController
  # no need for this, only try expose in my code
  expose :contacts, -> { @customer.contacts }

  before_action :set_customer
  before_action :set_contact, only: [:show, :update, :destroy]

  def index
    @contacts = contacts.includes(:created_by)

    render :index, status: :ok
  end

  def show
    render :show, status: :ok
  end

  def create
    @contact = @customer.contacts.new(contact_params)

    if @contact.save
      render :create, status: :created, location: v1_url([@customer, @contact])
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      render :update, status: :ok
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @contact.destroy
      head(:no_content)
    else
      head(:unprocessable_entity)
    end
  end

  private
    def set_contact
      @contact = @customer.contacts.find(params[:id])
    end

    def set_customer
      @customer ||= Customer.find(params[:customer_id].to_i)
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact)
        .permit(:name, :email, :phone)
        .merge(
          created_by: current_user
        )
    end
end
