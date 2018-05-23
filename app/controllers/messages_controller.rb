class MessagesController < ApplicationController
    skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_user!
    
def send_test_message
    require 'rubygems'
    require 'twilio-ruby'
    require 'dotenv'
    require 'dotenv-rails'
    
# put your own credentials here
account_sid = ENV['TWILIO_ACCT_ID']
puts account_sid
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
     body: 'What did you learn today?',
     from: '+12244582882',
     to: '+16305029079'
   )


    puts message.sid
    
    redirect_to("/")
    
end

def new_response
    
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'sinatra'

  puts(params)
  body = params[:Body]
  phone_number = params[:From].to_s
  puts(phone_number)
  phone_number = phone_number.gsub("+1",'')
  puts(phone_number)
  user_id=User.where(:phone_number => phone_number).first.id
  puts(user_id)
  @r = Response.new
  @r.question_id = Question.where(:user_id => user_id).first.id
  @r.user_id = user_id
  @r.response_text = body
  @r.time = DateTime.now
  @r.save
    
    
    
end

    
end

