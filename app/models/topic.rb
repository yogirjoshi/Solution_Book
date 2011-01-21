class Topic < ActiveRecord::Base
	has_and_belongs_to_many :users,
					:class_name => "users_areas",
					:foreign_key => "user_id"
	has_many :questions
	validates :name, :presence => true, :uniqueness	 => { :case_sensitive => false }

end
