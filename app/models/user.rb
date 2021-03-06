require "digest/sha1"

class User < ActiveRecord::Base
	has_and_belongs_to_many :topics
	has_many :questions
	has_many :answers
	has_many :goodqueries
	has_many :likedquestions, 
		   :through => :goodqueries, 
		   :class_name => "Question"

	attr_accessor :password
	attr_accessible :name, :password
	validates_uniqueness_of :name
	validates_presence_of :name, :password

	def before_create
		self.hashed_password = User.hash_password(self.password)
	end
	def after_create
		@password = nil
	end

	def self.login(name, password)
		hashed_password = hash_password(password || "")
		find(:first,
		:conditions => ["name = ? and hashed_password = ?",
		name, hashed_password])
	end
	def try_to_login
		User.login(self.name, self.password)
	end
	def rating(question)
		topicuser=TopicsUsers.find(:all,:conditions=>"topic_id = #{question.topic_id} and user_id=#{self.id}")
		topicuser.first.rating
	end
	private
	def self.hash_password(password)
		Digest::SHA1.hexdigest(password)
	end 
end     
        
        
        
        
        
        
        