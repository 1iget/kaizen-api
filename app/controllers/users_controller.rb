# frozen_string_literal: true

class UsersController < ProtectedController
  before_action :set_user, only: %i[update show]
  skip_before_action :authenticate, only: %i[signup signin]

  # POST '/sign-up'
  def signup
    user = User.create(user_creds)
    if user.valid?
      render json: user, status: :created
    else
      render json: user.errors, status: :bad_request
    end
  end

  # POST '/sign-in'
  def signin
    creds = user_creds
    if (user = User.authenticate creds[:email],
                                 creds[:password])
      render json: user, serializer: UserLoginSerializer, root: 'user'
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

  def index
    if current_user.isadmin == true
      render json: User.all
    else
      render json: @user, status: :unauthorized
    end
  end

  def show
    render json: @user
  end

  def update
    if current_user.isadmin == true
      @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unauthorized
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if current_user.isadmin == true
      @user.destroy(user_params)

      render json: @user
    else
      render json: @user.errors, status: :unauthorized
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_creds
    params.require(:credentials)
          .permit(:email, :password, :password_confirmation)
  end

  def pw_creds
    params.require(:passwords)
          .permit(:old, :new)
  end

  def user_params
    params.require(:user)
          .permit(:email, :isadmin)
  end
end
