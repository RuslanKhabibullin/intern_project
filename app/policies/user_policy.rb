class UserPolicy < BasePolicy
  def initialize(user, requested_user)
    self.user = user
    @requested_user = requested_user
  end

  def manage?
    user == @requested_user
  end
end
