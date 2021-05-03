class Api::V1::UsersController < ApiController
  before_action :authenticate_user! 
  before_action :set_user, only: [:get_current_user]

  def index
    users = User.all
    render json: users
  end

  def get_current_user
    render json: @user
  end

  private
  def set_user
    @user = current_user
  end

end