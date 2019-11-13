class Form < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :syndicate
end
