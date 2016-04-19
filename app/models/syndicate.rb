class Syndicate < ActiveRecord::Base
	belongs_to :user
	has_many :forms, dependent: :destroy


	def list
	array = Array.new
    forms = self.forms
	    forms.where('confirm_backer = ?', true ).each do |investment|
	      array << investment.investment_pledge.to_i
	    end
	    array.inject(:+)
  	end

end
