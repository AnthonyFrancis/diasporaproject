class Syndicate < ActiveRecord::Base
	belongs_to :user
	has_many :forms, dependent: :destroy

	scope :confirm_backer, -> {where(confirm_backer: true).sum(:investment_pledge)}

	
	def total_confirm_pledges
    	self.form.sum(:investment_pledge)
  	end

end
