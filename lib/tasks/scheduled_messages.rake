namespace :scheduled_messages do
  desc "Send scheduled messages"
    require 'rubygems'
    require 'twilio-ruby'

  task send_message: :environment do
    User.where(:enabled => 1).each do |user|
      
  end

end
