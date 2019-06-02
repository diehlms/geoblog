class Comment < ApplicationRecord
    
    belongs_to :user
    belongs_to :article, dependent: :destroy

    validates :content, presence: true, length: { minimum: 1, maximum: 500 }

end
