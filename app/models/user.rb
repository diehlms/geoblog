class User < ApplicationRecord
    has_many :comments
    has_many :geologyarticles
    has_many :musicarticles

    
end
