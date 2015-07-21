class MessageMailer < ActionMailer::Base

  default from: "Mali Info <noreply@maliinfo.herokuapp.com>"
  default to: "Djibril Drame <maliinfovideo@gmail.com>"

  def new_message(message)
    @message = message
    
    mail subject: "Message from #{message.name}"
  end

end