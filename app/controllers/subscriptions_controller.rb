class SubscriptionsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :show]
  before_action :redirect_to_signup, only: [:new, :show]

  def show
    @plans = Plan.all
  end

  def new
  end

  def create
    if current_user.stripe_id?
      customer = Stripe::Customer.retrieve(current_user.stripe_id)
    else
      customer = Stripe::Customer.create(email: current_user.email)
    end

    begin
    subscription = customer.subscriptions.create(
        source: params[:stripeToken],
        plan: params[:plan]
    )

    options = {
      stripe_id: customer.id,
      stripe_subscription_id: subscription.id,
    }

    #only update the card on file if we're adding a new one
    options.merge!(
      card_last4: params[:card_last4],
      card_exp_month: params[:card_exp_month],
      card_exp_year: params[:card_exp_year],
      card_brand: params[:card_brand]
      ) if params[:card_last4]

    current_user.update(options)

    flash.notice = "Thanks for subscribing"
    redirect_to root_path
    rescue Stripe::CardError => e
      flash.alert = e.message
      render action: :new
    end
  end

  def destroy
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    subscription = customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
    current_user.update(stripe_subscription_id: nil)

    redirect_to root_path, notice: "Your subscription has been canceled"
  end

  private

    def redirect_to_signup
      if !user_signed_in?
        session["user_return_to"] = subscription_path
        redirect_to new_user_registration_path
      end
    end
end