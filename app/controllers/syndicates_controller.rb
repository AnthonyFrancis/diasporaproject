class SyndicatesController < ApplicationController
  before_action :set_syndicate, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :correct_investor, only: [:create, :new]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @syndicates = Syndicate.all
  end

  def show
    @user = @syndicate.user
    @form = Form.new
    @formupdate = Form.new
    @formupdate = @syndicate.user.form
    @submissions = @syndicate.forms
    @backers = @syndicate.forms.where('confirm_backer = ?', true )
    #@backer = current_user.syndicate.forms.find_by(:syndicate_id)
  end

  def new
    @syndicate = current_user.syndicates.build
  end

  def edit
  end

  def create
    @syndicate = current_user.syndicates.build(syndicate_params)
    if @syndicate.save
      redirect_to @syndicate, notice: 'Syndicate was successfully created.'
    else
      render :new
    end
  end

  def update
    if @syndicate.update(syndicate_params)
      redirect_to :back, notice: 'Syndicate was successfully updated.'
    end
  end

  def destroy
    @syndicate.destroy
    redirect_to syndicates_url, notice: 'Syndicate was successfully destroyed.'
  end

  private
    def set_syndicate
      @syndicate = Syndicate.find(params[:id])
    end

    def correct_user
      @syndicate = current_user.syndicates.find_by(id: params[:id])
      redirect_to syndicates_path, notice: "Not authorized to edit this syndicate" if @syndicate.nil?
    end

    def correct_investor
      @syndicate = current_user.investor
      redirect_to syndicates_path, notice: "Not authorized to create a syndicate. Please apply to become an investor." if @syndicate == false
    end


    def syndicate_params
      params.require(:syndicate).permit(:description, :mininvest, :expecteddeals, :initial_investment)
    end
end
