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

  task :reflection_prototype => :environment do

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
      
    message = @client.messages
      .create(
         body: "Hi there! Thank you for trying WDYLT! It's been a little over a week; are you interested in trying out a deeper reflection? Click this link to get started --> https://bit.ly/2LGpUWt",
         from: ENV['TWILIO_NUMBER'],
         to: phone_number
       )
   
    puts message.sid
      
    end
  end



task :email_reflection => :environment do

    # User.where(:enabled => 1).each do |user|

        user = User.find(5)
        date_to = DateTime.now
        if user.last_reflection_on == nil
        date_from = user.created_at.to_date
        else
        date_from = user.last_reflection_on
        end
        @user_responses = Response.where(:user_id => user.id, :created_at => date_from.beginning_of_day..date_to.end_of_day).all
        @user = user
# end
    
    ReflectionMailer.weekly_reflection
end

end
