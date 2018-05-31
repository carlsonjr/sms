# namespace :migration_helper do

# task :add_last_reflection => :environment do
    
#     User.all.each do |user|
#     user.reflections.each do |reflection|
#         previous_reflection = Reflection.where("created_at < ? AND user_id = ?", reflection.created_at, user.id).first
#         reflection.previous_reflection_date = previous_reflection.created_at
        
    
    
#     end
    
# end
# end