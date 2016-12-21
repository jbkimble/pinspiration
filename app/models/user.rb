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
  has_many :pins, through: :boards
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id"

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  enum status: [:active, :disabled]

  before_validation :generate_slug

  attr_reader :private_boards

  def generate_slug
    self.slug = username.parameterize if username
  end

  def registered?
    roles.exists?(name: "user")
  end

  def admin?
    roles.exists?(name: "admin")
  end

  def public_boards
    boards.where(private:false)
  end

  def follow(someuser)
    active_relationships.create(followed_id: someuser.id)
  end

  def unfollow(someuser)
    active_relationships.find_by(followed_id: someuser.id).destroy
  end

  def following?(someuser)
    following.include?(someuser)
  end


  def public_boards
    boards.where(isprivate: false)
  end

  def set_private_boards(current_user)
    @private_boards = boards.where(isprivate:true) if self == current_user
    set_shared_private_boards(current_user) if self != current_user
  end

  private
    def set_shared_private_boards(current_user)
      board_ids = SharedBoard.where(owner_id:id, viewer_id:current_user.id).pluck(:board_id)
      @private_boards = Board.where(id: board_ids)
    end
end
