class Comment < ApplicationRecord

    validates :content, presence: true
    
    belongs_to :resume
    belongs_to :user
end
