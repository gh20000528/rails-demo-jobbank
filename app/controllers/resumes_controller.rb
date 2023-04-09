class ResumesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_resume, only: [:edit, :update, :show, :destroy]



    # 畫面
    def index
        if current_user.user?
            @resumes = current_user.resumes.order(created_at: :desc)
        else
            @resumes = Resume.order(created_at: :desc) #反轉讓新增資料在第一個
        end
        if params[:keyword].present?
            @resumes = @resumes.search(params[:keyword])
        end
    end
    def new
        @resume = Resume.new
        authorize @resume
    end

    def show
        #因為要建立在resume的show上面所以寫這
        @comment = Comment.new
        @comments = @resume.comments.where(user: current_user).order(created_at: :desc)
    end


    #新增
    def create
        # 寫入資料庫
        # clean_params = params.require(:resume).permit(:name , :email)
        @resume = current_user.resumes.new(resume_params)

        authorize @resume
        if @resume.save
            #flash 快閃訊息 => kind of hash
            flash[:notice] ='新增履歷成功'
            redirect_to resumes_path #回到首頁
        else
            # todo 失敗

            render :new #借new page render
            # render html:params
        end
        
    end
    #修改
    def edit
        authorize @resume
    end
    def update
        authorize @resume
        # @resume = Resume.new
        if @resume.update(resume_params)
            #flash 快閃訊息 => kinda of hash
            flash[:notice] ='新增履歷成功'
            redirect_to resumes_path #回到首頁
        else
            # todo 失敗

            render :new #借new page render
            # render html:params
        end
    end

    #刪除
    def destroy
        authorize @resume
        @resume.destroy
        redirect_to resumes_path, notice: '已刪除'
    end


    #私有區域
    private
    def resume_params
        params.require(:resume).permit(:name ,:email ,:tel ,:skill ,:intro, :city ,:education ,:experience ,:portfolio) #過濾

    end
    def find_resume

        if current_user.role == 1
            @resume = current_user.resumes.find(params[:id])
        else
            @resume = Resume.find(params[:id])
        end
        
    end    
    

end
