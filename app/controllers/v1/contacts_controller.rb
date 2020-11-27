class V1::ContactsController < AuthenticationController
  expose :contacts, -> { Customer.find(params[:customer_id].to_i).contacts }
  before_action :set_contact, only: [:show, :update, :destroy]

  def index
    @contacts = contacts.includes(:created_by)

    render :index, status: :ok
  end

  def show
    render :show, status: :ok
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: url_for([:api, :v1, @contact]) 
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      render json: @contact
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
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(:name, :email, :phone)
    end
end
