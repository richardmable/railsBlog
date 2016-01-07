class Post < ActiveRecord::Base
	has_many :commments
	belongs_to :user
end
