class Resume < ApplicationRecord
    acts_as_paranoid
    #驗證訊息          #存在             #格式
    validates :name , presence: true
    validates :email , presence: true , format: {with: /\A[\w\-._]+@[\w\-._]+\.[A-Za-z]{2,}\z/ }
    validates :tel , presence: true

    belongs_to :user
    has_many :comments


    # 搜尋功能
    def self.search(keyword)
        where("intro like ?", "%#{keyword}%")
    end
end