class Question < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic
	has_many :goodqueries
	has_many :likedby, 
		   :through => :goodqueries, 
		   :class_name => "User"
end
