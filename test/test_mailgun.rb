require 'mailgun-ruby'

def send_email(from, to, subject, text)
  mg_client = Mailgun::Client.new("3b80caf720cf06f75e70280b7c24071a-1b8ced53-6329cd2e")

  message_params =  {
    from: from,
    to:   to,
    subject: subject,
    text:    text
  }

  result = mg_client.send_message('sandboxf306c5e9e0354454bf3130aa88de8717.mailgun.com', message_params).to_h!
  print(result)
end

send_email("blah@gmail.com", "zumin2016@gmail.com", "abc", "aaa")
# send_email('admin@garagesale.com', "#{User.find_by_id(@item.user_id).email}",'Your item sold', " #{current_user} bought one of your item #{@item.title} " )
# send_email('admin@garage.com', " #{current_user.email}", "Thank you for your order", "Thank you for your order. We will get your item shipped soon")