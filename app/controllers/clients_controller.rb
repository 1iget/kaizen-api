# frozen_string_literal: true

class ClientsController < ProtectedController
  # Original before_action
  # before_action :set_client, only: [:show, :update, :destroy]
  before_action :set_client, only: %i[signout update show]
  skip_before_action :authenticate, only: %i[signup signin]

  # POST '/sign-up'
  def signup
    user = Client.create(user_creds)
    if user.valid?
      render json: user, status: :created
    else
      render json: user.errors, status: :bad_request
    end
  end

  # POST '/sign-in'
  def signin
    creds = user_creds
    if (user = Client.authenticate creds[:email],
                                   creds[:password])
      render json: user, serializer: ClientSerializer, root: 'user'
      # TODO: Leverage UserLoginSerializer or build ClientLoginSerializer?
    else
      head :unauthorized
    end
  end

  # DELETE '/sign-out'
  def signout
    current_user.logout
    head :no_content
  end

  # PATCH '/change-password/:id'
  def changepw
    # if the the old password authenticates,
    # the new one is not blank,
    # and the model saves
    # then 204
    # else 400
    if current_user.authenticate(pw_creds[:old]) &&
       !(current_user.password = pw_creds[:new]).blank? &&
       current_user.save
      head :no_content
    else
      head :bad_request
    end
  end

  # GET /clients
  def index
    @clients = Client.all

    render json: @clients
  end

  # GET /clients/1
  def show
    render json: @client
  end

  # POST /clients
  # def create
  #   @client = Client.new(client_params)
  #
  #   if @client.save
  #     render json: @client, status: :created, location: @client
  #   else
  #     render json: @client.errors, status: :unprocessable_entity
  #   end
  # end
  # TODO: Consider deleting entirely

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  # def destroy
  #   @client.destroy
  # end
  # TODO: Consider deleting entirely

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    # @client = current_user.clients.find(params[:id])
    @client = Client.find(params[:id])
  end

  def user_creds
    params.require(:credentials)
          .permit(:email, :password, :password_confirmation)
  end

  def pw_creds
    params.require(:passwords)
          .permit(:old, :new)
  end

  # Only allow a trusted parameter "white list" through.
  def client_params
    params.require(:client).permit(:email)
  end
end
