require 'mailgun-ruby'

module MailgunHelper

def send_email(from, to, subject, text)
  api_key = Rails.application.credentials.mailgun[:api_key]
  mg_client = Mailgun::Client.new(api_key)

  message_params =  {
    from: from,
    to:   to,
    subject: subject,
    text:    text
  }

  mg_client.send_message('sandbox02d977fdcd5c475082288a10816da577.mailgun.com', message_params).to_h!
end

end