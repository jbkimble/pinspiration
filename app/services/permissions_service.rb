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
      return true if controller == "users" && action.in?(%w(show edit update new create))
      return true if controller == "comments" && action.in?(%w(index show edit update new create destroy))
      return true if controller == "profile" && action.in?(%w(show))
    end

    def user_permissions
      return true if controller == "sessions" && action.in?(%w(index new create destroy))
      return true if controller == "users" && action.in?(%w(show edit update new create))
      return true if controller == "comments" && action.in?(%w(index show edit update new create destroy))
      return true if controller == "profile" && action.in?(%w(show))
    end

    def guest_permissions
      return true if controller == "sessions" && action.in?(%w(index new create))
      return true if controller == "users" && action.in?(%w(new create))
    end
end
