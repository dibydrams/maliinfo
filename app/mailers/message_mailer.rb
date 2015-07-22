class MessageMailer < ActionMailer::Base

  default to: "Mali Info <maliinfovideo@gmail.com>"

  def new_message(message)
    @message = message
    
    mail(from: "#{message.name} <#{message.email}>", reply_to: "#{message.email}", subject: "[Formulaire de contact Mali Info] #{message.subject}")
  end

end