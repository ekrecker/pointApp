class LoginController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  def index
  end

  def after_sign_in_path_for(resource)
    mypage_root_path '/'
  end
end
