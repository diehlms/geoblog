class Article < ApplicationRecord
    self.per_page = 10
    
    belongs_to :user
    has_many :comments

    mount_uploader :image, ImageUploader
    serialize :image, JSON

end
