class MessagesController < ApplicationController

  # GET /messaes/new
  def new
    @message = Message.new
    @users = current_user.friends
  end

  # GET /messages
  def index
    @user = User.find params[:user_id]
  end

  # GET /messages/:id
  def show
    @message = Message.find params[:id]
    if @message.read_at == nil && current_user == @message.recipient
      @message.mark_as_read
    end
  end

  # GET /messages/sent
  def sent
    load_user
    @messages = @user.sent_messages
  end

  def received
    load_user
    @messages = @user.received_messages
  end

  def load_user
    if params[:user_id]
      @user = User.find params[:user_id]
    else
      @user = current_user
    end
  end

  def incoming
    @messages = current_user.incoming_messages # Filters the incoming messages to current user
  end

  # POST /messages
  def create
    @message = Message.new message_params
    @message.sender = current_user
    if @message.save
      flash[:success] = "Message Sent!"
      redirect_to messages_incoming_path
    else
      render 'new'
    end
  end


  private
  def message_params
    params.require(:message).permit(:recipient_id, :body, :subject)
  end
end
