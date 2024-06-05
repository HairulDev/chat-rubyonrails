class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show update destroy ]

  # GET /messages
  def index
    @messages = Message.all
    # @messages = Message.all.map do |message|
    #   message.attributes.merge(user: User.find_by(_id: message.user_created))
    # end
    render json: @messages
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      render json: @message, status: :created, location: @message
    else
      render_error(@message.errors)
    end
  end

  # GET /messages/1
  def show
    render json: @message
  end

  # PATCH/PUT/messages/1
  def update
    if @message.update(message_params)
      render json: @message, status: :created, location: @message
    else
      render_error(@message.errors)
    end
  end
  
  # DELETE /messages/1
  def destroy
    # @message.destroy
    @message = Message.find(params[:id])
    @message.destroy
      render json: @message
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:id, :body, :user_created, :name, :email, :image, :message, :group_id)
      # params.require(:message).permit(:body)

    end

    def render_error(errors)
      render json: { errors: errors }, status: :unprocessable_entity
    end

end
