class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # @user = User.new
  end
  # def user_params
  #   params.require(:user).permit(:email, :password)
  # end
end
