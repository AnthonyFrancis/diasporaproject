class Form < ActiveRecord::Base
	belongs_to :user
	belongs_to :syndicate

	scope :confirm_backer, -> {where(confirm_backer: true)}

	def pledge
		pledge = self.investment_pledge.all
		pledge.map 
	end

	def test_now
		where('confirm_backer = ?', true ).sum(:investment_pledge)
	end
end
