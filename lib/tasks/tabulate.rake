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
  
  
    task :reflections_by_day => :environment do

    user_hashes = []    
    User.all.each do |user|
      email = user.email
      user_hash = {:email => email}        
      d = Date.today
      days =[d, d-1, d-2]
      
        i = 0
      
      days.each do |day|
        count = user.reflection_answers.where(:created_at => day.beginning_of_day..day.end_of_day).count
        key_name = "day #{i}"
        user_hash[key_name] = count
        i = i-1
      end
     
      user_hashes.push(user_hash)
    end
    puts(user_hashes)
  end
  
  task :reflections_by_day => :environment do

    user_hashes = []    
    User.all.each do |user|
      email = user.email
      user_hash = {:email => email}        
      d = Date.today
      days =[d, d-1, d-2]
      
        i = 0
      
      days.each do |day|
        count = user.responses.where(:created_at => day.beginning_of_day..day.end_of_day).count
        key_name = "day #{i}"
        user_hash[key_name] = count
        i = i-1
      end
     
      user_hashes.push(user_hash)
    end
    puts(user_hashes)
  end
  

end
