class Topic < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :questions
	validates :name, :presence => true, :uniqueness	 => { :case_sensitive => false }

end
