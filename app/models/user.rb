class User < ApplicationRecord
    validates :email , presence: true,
                       uniqueness: true,
                       format: {
                        with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/
                       }
    validates :password, presence: true, confirmation: true
    validates :birthday, presence: true
    

    #callback
    before_create :encrypt_password

    #relationhips
    #找到resumes中的user欄位做關聯
    has_many :resumes
    has_many :comments
    
    
    #rails 內建方法，將下拉選單key跟value連接
    enum role: { user: 1, company: 2, staff: 3 }
    enum gender: { "不公開": 0, "男": 1, "女": 2, "其它": 3 }




    class << self
        #自訂方法讓 key : value,對成key : key
        def gender_list
            genders.map{|k , v| [k  , k]}
        end

        #密碼加密驗證
        def login(email:, password:)
            encrypted_password = Digest::SHA1.hexdigest("7a#{password}9x")
            find_by(email: email, password: encrypted_password)
        end
    end

    private

    def encrypt_password
        self.password = Digest::SHA1.hexdigest("7a#{self.password}9x") 
    end
    

end
