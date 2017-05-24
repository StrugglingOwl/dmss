class WelcomeController < ApplicationController
  def index
    # 如果是登陆用户，重定向到记录列表页面，否则留在Welcome页面
    if current_user
      redirect_to records_path
    end
  end
end
