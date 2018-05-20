namespace :scheduled_messages do
  desc "Send scheduled messages"
    require 'rubygems'
    require 'twilio-ruby'
    require 'dotenv'
    require 'dotenv-rails'
    
  task :send_message => :environment do

# Authenticate with Twilio
      account_sid = ENV['TWILIO_ACCT_ID']
      puts account_sid
      auth_token = ENV['TWILIO_AUTH_TOKEN']
      puts auth_token

# set up a client to talk to the Twilio REST API
      @client = Twilio::REST::Client.new(account_sid, auth_token)
      
# Loop through users and send message
    User.where(:enabled => 1).each do |user|
      phone_number = "+1"+user.phone_number
      question = Question.where(:user_id => user.id).first.question

    message = @client.messages
      .create(
         body: question,
         from: ENV['TWILIO_NUMBER'],
         to: phone_number
       )
   
    puts message.sid
      
    end
  end

end
