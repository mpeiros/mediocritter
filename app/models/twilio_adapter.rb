module TwilioAdapter
  TWILIO_CLIENT = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'],
                                           ENV['TWILIO_AUTH_TOKEN'])

  def self.send_text(message)
    TWILIO_CLIENT.account.messages.create(body: message,
                                          to: ENV['TWILIO_TO'],
                                          from: ENV['TWILIO_FROM'])
  end
end
