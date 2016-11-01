class UserPolicy
  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def manage?
    @current_user == @user
  end
end