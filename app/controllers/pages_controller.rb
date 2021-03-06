class PagesController < ApplicationController
  def home
  	@syndicates = Syndicate.all
  	@users = User.all
    if current_user_subscribed?
      @profiles = Profile.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
    else
      @profiles = Profile.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
    end
  end

  def about
  end

  def companies
  end

  def resources
  end

  def premium
  end

  #files for resources

  def pitchdeck
  pdf_filename = File.join(Rails.root, "public/files/Pitch.pdf")
  send_file(pdf_filename, :filename => "Pitch.pdf", :disposition => 'inline', :type => "application/pdf", x_sendfile: true)
  end

  def notepurchase
  pdf_filename = File.join(Rails.root, "public/files/Note Purchase Agreement.pdf")
  send_file(pdf_filename, :filename => "Note Purchase Agreement.pdf", :disposition => 'inline', :type => "application/pdf")
  end

  def foundersaccord
  pdf_filename = File.join(Rails.root, "public/files/Founders Accord.pdf")
  send_file(pdf_filename, :filename => "Founders Accord.pdf", :disposition => 'inline', :type => "application/pdf")
  end

  def execsummary
  pdf_filename = File.join(Rails.root, "public/files/Execsummary.pdf")
  send_file(pdf_filename, :filename => "Execsummary.pdf", :disposition => 'inline', :type => "application/pdf")
  end

  def convertablenote
  pdf_filename = File.join(Rails.root, "public/files/Convertible Note.pdf")
  send_file(pdf_filename, :filename => "Convertible Note.pdf", :disposition => 'inline', :type => "application/pdf")
  end

  def accreditedinvestor
  pdf_filename = File.join(Rails.root, "public/files/Accredited Investor Questionnaire.pdf")
  send_file(pdf_filename, :filename => "Accredited Investor Questionnaire.pdf", :disposition => 'inline', :type => "application/pdf")
  end

end
