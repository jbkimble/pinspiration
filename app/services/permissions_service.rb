class PermissionsService
  def initialize(user, controller, action)
    @action = action
    @controller = controller
    @user = user || User.new
  end

  def allow?
    if user.admin?
      admin_permissions
    elsif user.registered?
      user_permissions
    else
      guest_permissions
    end
  end

  private
    attr_reader :action, :controller, :user

    def admin_permissions
      return true if controller == "sessions" && action.in?(%w(index new create destroy))
      return true if controller == "users" && action.in?(%w(index show edit update new create))
      return true if controller == "comments" && action.in?(%w(index show edit update new create destroy))
      return true if controller == "profile" && action.in?(%w(show))
      return true if controller == "pins" && action.in?(%w(index show new create edit update destroy))
      return true if controller == "pin_boards" && action.in?(%w(index show new create update edit destroy))
      return true if controller == "relationships" && action.in?(%w(create destroy))
      return true if controller == "users/followers" && action.in?(%w(index))
      return true if controller == "users/following" && action.in?(%w(index))
      return true if controller == "boards" && action.in?(%w(new create edit update destroy))
      return true if controller == "users/boards" && action.in?(%w(index show))
      return true if controller == "admin/dashboard" && action.in?(%w(show))
      return true if controller == "admin/pins" && action.in?(%w(index show destroy))
      return true if controller == "passwords" && action.in?(%w(new create update))
    end

    def user_permissions
      return true if controller == "sessions" && action.in?(%w(index new create destroy))
      return true if controller == "users" && action.in?(%w(index show edit update new create))
      return true if controller == "comments" && action.in?(%w(index show edit update new create destroy))
      return true if controller == "profile" && action.in?(%w(show))
      return true if controller == "pins" && action.in?(%w(index show))
      return true if controller == "pin_boards" && action.in?(%w(index show new create update edit destroy))
      return true if controller == "pins" && action.in?(%w(index show new create edit update destroy))
      return true if controller == "relationships" && action.in?(%w(create destroy ))
      return true if controller == "users/followers" && action.in?(%w(index))
      return true if controller == "users/following" && action.in?(%w(index))
      return true if controller == "boards" && action.in?(%w(new create edit update destroy))
      return true if controller == "users/boards" && action.in?(%w(index show))
      return true if controller == "passwords" && action.in?(%w(new create update))
    end

    def guest_permissions
      return true if controller == "sessions" && action.in?(%w(index new create))
      return true if controller == "users" && action.in?(%w(index show new create))
      return true if controller == "pins" && action.in?(%w(index show))
      return true if controller == "pin_boards" && action.in?(%w(new))
      return true if controller == "users/boards" && action.in?(%w(index show))
      return true if controller == "users/followers" && action.in?(%w(index))
      return true if controller == "users/following" && action.in?(%w(index))
      return true if controller == "passwords" && action.in?(%w(new create update))
    end
end
