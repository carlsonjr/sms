namespace :migration_helper do

task :add_last_reflection => :environment do
    
    User.all.each do |user|
        @reflections_set = user.reflections.all.order(id: :desc)
        @reflections_set.each do |reflection|
           helper = @reflections_set.where("created_at < ?", reflection.created_at).count
           if helper >0 
                p = @reflections_set.where("created_at < ?", reflection.created_at).first
                reflection.previous_reflection_date = p.created_at
           else
                reflection.previous_reflection_date = user.created_at
           end
           reflection.save
        end
    end
        
end
end



