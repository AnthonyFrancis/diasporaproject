class CardsController < ApplicationController
	before_action :authenticate_user!

	def new
		@user = current_user
		@plan = Plan.find(params[:plan_id])

		respond_to do |format|
			format.js
		end
	end

	def show
  	end

	def update
		customer = Stripe::Customer.retrieve(current_user.stripe_id)

		begin
	    subscription = customer.subscriptions.retrieve(current_user.stripe_subscription_id)
	    subscription.source = params[:stripeToken]
	    subscription.save

    	current_user.update(
	      card_last4: params[:card_last4],
	      card_exp_month: params[:card_exp_month],
	      card_exp_year: params[:card_exp_year],
	      card_brand: params[:card_brand]
	    )

	    redirect_to :back, notice: 'Successfully updated your card'
	    rescue Stripe::CardError => e
	      flash.alert = e.message
	      redirect_to :back
	    end
	end 

end
