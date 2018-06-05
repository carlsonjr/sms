class LandingController < ApplicationController
   skip_before_action :authenticate_user!
   
   def landing
      render layout: "landing_layout", template: "pages/landing.html.erb"
   end
   
    
   
    
end