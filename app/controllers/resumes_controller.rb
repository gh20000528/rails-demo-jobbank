class ResumesController < ApplicationController




    # 畫面
    def index
        @resume = Resume.new
    end
    def new
        @resume = Resume.new
    end


    #新增
    def create
        # 寫入資料庫
        # clean_params = params.require(:resume).permit(:name , :email)
        resume = Resume.new(resume_params)
        if resume.save
            redirect_to root_path #回到首頁
        else
            render html:params
        end
        
    end

    #私有區域
    private
    def resume_params
        params.require(:resume).permit(:name ,:email ,:tel ,:skill ,:intro, :city ,:education ,:experience ,:portfolio)

    end


end
