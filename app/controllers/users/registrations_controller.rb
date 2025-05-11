class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user = User.new(sign_up_params)

    if user.save
      render json: { user: user, message: 'Usuário criado com sucesso.' }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  protected

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
