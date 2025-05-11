class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  # Após o login, retorne o usuário e o token JWT
  def respond_with(resource, _opts = {})
    # Usamos o método `encode` para gerar o JWT
    token = Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil)
    
    render json: { 
      user: resource, 
      token: token.first,  # Aqui, pegamos o primeiro elemento do array
      message: 'Login realizado com sucesso.' 
    }, status: :ok
  end

  # Para o logout, apenas responde com uma mensagem de sucesso
  def respond_to_on_destroy
    render json: { message: 'Logout realizado com sucesso.' }, status: :ok
  end
end
