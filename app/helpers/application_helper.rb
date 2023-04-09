module ApplicationHelper
    def format_date(data)
        data.strftime('%Y/%-m/%-d')  #設定時間格式
    end
    # def user_signed_in?
    #     session[:_user_resume_dev_].present?
    # end

    # def current_user
    #     return User.find_by(id: session[:_user_resume_dev_]) if user_signed_in?
    
    #     return nil
    #   end
    
    
end
