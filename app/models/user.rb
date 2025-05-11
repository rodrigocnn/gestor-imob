class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # Para invalidar tokens antigos, usando o próprio modelo
  include Devise::JWT::RevocationStrategies::JTIMatcher
end


