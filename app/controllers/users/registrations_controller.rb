# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create 
    super do |user|
      
      
      # Create question
      question = Question.new
      question.user_id = user.id
      question.question = params[:question_text]
      question.save
      
      
      
      
      require 'rubygems'
      require 'twilio-ruby'
      require 'dotenv'
      require 'dotenv-rails'
      # Authenticate with Twilio
            account_sid = ENV['TWILIO_ACCT_ID']
            auth_token = ENV['TWILIO_AUTH_TOKEN']

      # set up a client to talk to the Twilio REST API
            @client = Twilio::REST::Client.new(account_sid, auth_token)
            
      # Loop through users and send message
          phone_number = "+1"+user.phone_number

          message = @client.messages
            .create(
               body: "Welcome to WDYLT! Here's how this works. Every day, I'll send you a quick message to prompt you to reflect. Anything you send me, I'll record. So, just reply to these messages and I'll help you reflect.",
               from: ENV['TWILIO_NUMBER'],
               to: phone_number
             )
         
          puts message.sid
          
       
         
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
