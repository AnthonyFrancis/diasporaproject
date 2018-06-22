class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.mailbox.conversations
  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
  end


  def new
    @recipients = User.all - [current_user]
  end

  def create
    recipient = User.find(params[:user_id])
    receipt = current_user.send_message(recipient, params[:body], params[:subject])
    redirect_to conversation_path(receipt.conversation)
  end


  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end

  def message_params
    params.require(:message).permit(:body, :subject)
  end
end