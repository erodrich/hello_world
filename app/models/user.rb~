class User < ActiveRecord::Base
  has_many :services, dependent: :destroy
  before_save { self.correo = correo.downcase }
  validates :nombre, presence: true, length: {maximum: 50}
  validates :apellido, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :correo, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}
  
  def user_services
    services
  end
end
