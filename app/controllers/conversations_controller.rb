class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.mailbox.conversations
  end

  def new
    @recipients = User.where.not(id: current_user.id)
  end

  def create
    recipient = User.find(conversation_params[:recipient])
    message = current_user.send_message(recipient, conversation_params[:body], "-")
    redirect_to conversation_path(message.conversation), notice: "Message successfully sent"
  end

  def show
    @receipts = conversation.receipts_for(current_user).order(created_at: :asc)
    conversation.mark_as_read(current_user) # mark as read
  end

  def reply
    current_user.reply_to_conversation(conversation, message_params[:body])
    redirect_to conversation_path(conversation), notice: "Your reply message was successfully sent!"
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to mailbox_inbox_path
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to mailbox_inbox_path
  end

  private

  def conversation_params
    params.require(:conversation).permit(:body, :recipient)
  end

  def message_params
    params.require(:message).permit(:body, :subject)
  end
end