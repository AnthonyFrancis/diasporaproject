class PagesController < ApplicationController
  def home
  	@syndicates = Syndicate.all
  	@users = User.all
  end

  def about
  end

  def companies
  end

  def premium
  end
end
