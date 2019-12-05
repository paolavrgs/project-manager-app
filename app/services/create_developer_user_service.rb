class CreateDeveloperUserService
  attr_reader :user_params, :developer

  def initialize(developer_instance, user_params: {})
    @user_params = user_params
    @developer = developer_instance
  end

  def process
    user = User.new(@user_params)
    return user if user.save

    nil
  end
end
