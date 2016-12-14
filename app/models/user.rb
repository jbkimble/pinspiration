class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :phone, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :roles, through: :user_roles
  has_many :user_roles
  has_many :comments
  has_many :boards

  after_save :generate_slug
  
  def generate_slug
    self.slug = name.parameterize
  end

  def registered?
    roles.exists?(name: "user")
  end

  def admin?
    roles.exists?(name: "admin")
  end 
end
