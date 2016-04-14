class Form < ActiveRecord::Base
	belongs_to :user
	belongs_to :syndicate
end
