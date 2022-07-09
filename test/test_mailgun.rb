require 'mailgun-ruby'

def send_email(from, to, subject, text)
  mg_client = Mailgun::Client.new("b63d31824d3cb3c7b6e829f28e8d71ca-1b8ced53-8e0e2bd7")

  message_params =  {
    from: from,
    to:   to,
    subject: subject,
    text:    text
  }

  result = mg_client.send_message('sandbox02d977fdcd5c475082288a10816da577.mailgun.com', message_params).to_h!
  print(result)
end

begin
  send_email("admin@garagesale.com", "msubzero2000@gmail.com", "abc", "aaa")
rescue => e
end
# send_email('admin@garagesale.com', "#{User.find_by_id(@item.user_id).email}",'Your item sold', " #{current_user} bought one of your item #{@item.title} " )
# send_email('admin@garage.com', " #{current_user.email}", "Thank you for your order", "Thank you for your order. We will get your item shipped soon")