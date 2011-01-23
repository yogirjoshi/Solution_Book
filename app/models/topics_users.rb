class TopicsUsers < ActiveRecord::Base
	set_primary_keys :topic_id, :user_id
end
