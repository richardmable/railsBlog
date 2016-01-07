class Comment < ActiveRecord::Base
	has_one :post
	has_one :user
end
