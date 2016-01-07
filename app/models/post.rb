class Post < ActiveRecord::Base
	has_one :user
	has_many :comments
end
