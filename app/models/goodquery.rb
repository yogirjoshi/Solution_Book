class Goodquery < ActiveRecord::Base
	belongs_to :user  # foreign key - programmer_id
  	belongs_to :question     # foreign key - project_id
end
