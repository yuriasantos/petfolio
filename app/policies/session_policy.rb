class SessionPolicy
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def new?
    # Allow anyone to visit the login page
    true
  end
end
