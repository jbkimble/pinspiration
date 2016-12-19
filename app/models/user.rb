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
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id"

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  before_validation :generate_slug

  def generate_slug
    self.slug = username.parameterize if username
  end

  def registered?
    roles.exists?(name: "user")
  end

  def admin?
    roles.exists?(name: "admin")
  end

<<<<<<< HEAD
  def public_boards
    boards.where(private:false)
=======
  def follow(someuser)
    active_relationships.create(followed_id: someuser.id)
  end

  def unfollow(someuser)
    active_relationships.find_by(followed_id: someuser.id).destroy
  end

  def following?(someuser)
    following.include?(someuser)
>>>>>>> 9bdc56aba0ffc190f25a8483408a6a99410b2906
  end

end
