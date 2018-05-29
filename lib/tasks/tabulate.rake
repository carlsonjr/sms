namespace :tabulate do
  desc "Analytics on users"
    
  task :sum_responses => :environment do

    user_hashes = []    
    User.all.each do |user|
      email = user.email
      
      count = user.responses.count
      puts "#{email} -- #{count}"
      
      user_hash = {:email => email, :count => count }
      user_hashes.push(user_hash)
    end
    puts(user_hashes)
  end

end
