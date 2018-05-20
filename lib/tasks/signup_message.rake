namespace :signup_message do
  desc "Send signup message"
    require 'rubygems'
    require 'twilio-ruby'
    require 'dotenv'
    require 'dotenv-rails'
    
  task :send_message => :environment do

    current_user = User.find(1)
# Authenticate with Twilio
      account_sid = ENV['TWILIO_ACCT_ID']
      puts account_sid
      auth_token = ENV['TWILIO_AUTH_TOKEN']
      puts auth_token

# set up a client to talk to the Twilio REST API
      @client = Twilio::REST::Client.new(account_sid, auth_token)
      
# Loop through users and send message
    phone_number = "+1"+current_user.phone_number
      question = Question.where(:user_id => current_user.id).first.question

    message = @client.messages
      .create(
         body: "Welcome to WDYLT! Every day, I'll send you a quick message to prompt you to reflect. Just reply to these messages and I'll handle the rest.",
         from: ENV['TWILIO_NUMBER'],
         to: current_user.phone_number
       )
   
    puts message.sid
    

    message = @client.messages
      .create(
         body: question,
         from: ENV['TWILIO_NUMBER'],
         to: current_user.phone_number
       )
   
    puts message.sid
    
    
      
    end
  end

