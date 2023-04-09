class ApplicationController < ActionController::Base
  # pundit套件提供的用於驗證用戶權限的方法和工具
  include Pundit::Authorization
  # 如果在rails出現這個錯誤用with後的方法
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # 如果路徑錯誤用with後的方法
  rescue_from ActiveRecord::RecordNotFound , with: :record_not_found
  # 設定了兩個 Helper 方法，分別是 user_signed_in? 和 current_user1，這些方法可以在 View 中使用，用於判斷當前用戶是否已經登錄，以及返回當前登錄的用戶對象
  helper_method :user_signed_in?, :current_user

  
  private
  #檢查是否是登入狀態
  def user_signed_in?
    session[:_user_resume_dev_].present?
  end
  
  def current_user
    if user_signed_in?
      return @_user_ ||=User.find_by(id: session[:_user_resume_dev_]) 
      
    end
    # return User.find_by(id: session[:_user_resume_dev_]) if user_signed_in?

    return nil
  end

  def authenticate_user!
    if not user_signed_in?
      redirect_to sign_in_users_path
    end
  end

  #404 not-found
  def record_not_found
    render file:Rails.root.join('public' , '404.html'),
           layout: false,
           status: 404 and return
  end

  #pundit套件權限控制
  def user_not_authorized
    flash[:alert] = "權限不足"
    redirect_back(fallback_location: root_path)  #跳轉回首頁
  end
end
