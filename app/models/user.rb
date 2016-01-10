class User < ActiveRecord::Base
	has_one :profile
	has_many :comments
	has_many :posts
end
