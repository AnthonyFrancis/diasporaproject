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

    list.investors << @investor
  end

  def destroy
    @investor = Profile.find_by(id: params[:id])

    list = current_user.list

    list.investors.delete(@investor)
  end
end
