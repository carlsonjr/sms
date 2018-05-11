class MessagesController < ApplicationController
def send_test_message
    require 'rubygems'
    require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC29aac65aa779f96b0410a0e6c21e60b1'
auth_token = '70cc034bec6921c082ceaeed895b2a8f'

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

# send a dynamic reply to incoming text message
  # transform request body to lowercase
  body = params['Body'].downcase
  ap(body)
  @r = Response.new
  @r.question_id = 1
  @r.user_id = 1
  @r.response_text = body
  @r.time = DateTime.now
  @r.save
    
    
end

    
end

