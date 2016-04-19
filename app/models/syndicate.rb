class Syndicate < ActiveRecord::Base
	belongs_to :user
	has_many :forms, dependent: :destroy


	def list
	array = Array.new
    forms = self.forms
	    forms.all.each do |investment|
	      array << investment.investment_pledge
	    end
	    array.to_s.gsub('"', '')
	    total_sales = array.map {|s| s['sale_price']}.reduce(0, :+)
  	end

end
