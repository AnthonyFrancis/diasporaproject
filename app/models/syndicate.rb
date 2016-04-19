class Syndicate < ActiveRecord::Base
	belongs_to :user
	has_many :forms, dependent: :destroy


	def list
	intial_investment = self.initial_investment.to_i
	array = Array.new
    forms = self.forms
	    forms.where('confirm_backer = ?', true ).each do |investment|
	      array << investment.investment_pledge.to_i
	    end
	    array.inject(:+) + intial_investment
  	end

end
