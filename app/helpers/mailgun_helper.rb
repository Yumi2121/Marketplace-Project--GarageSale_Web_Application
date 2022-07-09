require 'mailgun-ruby'

module MailgunHelper

def send_email(from, to, subject, text)
  api_key = Rails.application.credentials.mailgun[:api_key]
  domain = Rails.application.credentials.mailgun[:domain]
  mg_client = Mailgun::Client.new(api_key)

  message_params =  {
    from: from,
    to:   to,
    subject: subject,
    text:    text
  }

  mg_client.send_message(domain, message_params).to_h!
end

end