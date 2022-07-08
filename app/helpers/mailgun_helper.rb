require 'mailgun-ruby'

module MailgunHelper

def send_email(from, to, subject, text)
  mg_client = Mailgun::Client.new("3b80caf720cf06f75e70280b7c24071a-1b8ced53-6329cd2e")

  message_params =  {
    from: from,
    to:   to,
    subject: subject,
    text:    text
  }

  mg_client.send_message('sandboxf306c5e9e0354454bf3130aa88de8717.mailgun.com', message_params).to_h!
end

end