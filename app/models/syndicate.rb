class Syndicate < ActiveRecord::Base
	belongs_to :user
	has_many :forms
end
