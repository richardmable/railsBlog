class User < ActiveRecord::Base
	has_one :profile
	has_many :post
	has_many :comment
end
