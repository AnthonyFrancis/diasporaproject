class Form < ActiveRecord::Base
	belongs_to :user
	belongs_to :syndicate

	scope :confirm_backer, -> {where(confirm_backer: true)}
end
