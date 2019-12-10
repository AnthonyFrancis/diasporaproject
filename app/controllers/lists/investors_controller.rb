class Lists::InvestorsController < ApplicationController
  before_action :authenticate_user!

  def create
    # TODO: move into a service for scalability
    @investor = Profile.find_by(id: params[:add])

    return if @investor.nil?

    if current_user.list.nil?
      list = List.create(user: current_user, name: ' Investor list')
    else
      list = current_user.list
    end

    if current_user.plan_limit_reached?
      @can_add = false
    else
      list.investors << @investor
      @can_add = true
    end
  end

  def destroy
    @investor = Profile.find_by(id: params[:id])

    list = current_user.list

    list.investors.delete(@investor)
  end
end
