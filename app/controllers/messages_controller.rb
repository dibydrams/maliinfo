class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    if @message.valid?
      MessageMailer.new_message(@message).deliver_now
      redirect_to contact_path, notice: "Votre message a été envoyé. Nous vous répondrons dès que possible."
    else
      flash[:alert] = "Une erreur s'est produite lors de l'envoi de votre message. Veuillez réessayer"
      render :new
    end
  end

private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :content)
  end

end
