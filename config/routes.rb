Rails.application.routes.draw do


  # Routes for initial prototype of reflections
  get("/reflection_setup", {:controller => "reflections", :action => "setup"})
  post("/submit_questions", {:controller => "reflections", :action => "submit_questions"})
  get("/new_reflection", {:controller => "reflections", :action => "new_reflection"})
  post("/submit_reflection", {:controller =>"reflections", :action => "submit_reflection"})
  get("/print", {:controller => "responses", :action => "print"})



  # Routes for the Reflection answer resource:

  # CREATE
  get("/reflection_answers/new", { :controller => "reflection_answers", :action => "new_form" })
  post("/create_reflection_answer", { :controller => "reflection_answers", :action => "create_row" })

  # READ
  get("/reflection_answers", { :controller => "reflection_answers", :action => "index" })
  get("/reflection_answers/:id_to_display", { :controller => "reflection_answers", :action => "show" })

  # UPDATE
  get("/reflection_answers/:prefill_with_id/edit", { :controller => "reflection_answers", :action => "edit_form" })
  post("/update_reflection_answer/:id_to_modify", { :controller => "reflection_answers", :action => "update_row" })

  # DELETE
  get("/delete_reflection_answer/:id_to_remove", { :controller => "reflection_answers", :action => "destroy_row" })

  #------------------------------

  # Routes for the Reflection question resource:

  # CREATE
  get("/reflection_questions/new", { :controller => "reflection_questions", :action => "new_form" })
  post("/create_reflection_question", { :controller => "reflection_questions", :action => "create_row" })

  # READ
  get("/reflection_questions", { :controller => "reflection_questions", :action => "index" })
  get("/reflection_questions/:id_to_display", { :controller => "reflection_questions", :action => "show" })

  # UPDATE
  get("/reflection_questions/:prefill_with_id/edit", { :controller => "reflection_questions", :action => "edit_form" })
  post("/update_reflection_question/:id_to_modify", { :controller => "reflection_questions", :action => "update_row" })

  # DELETE
  get("/delete_reflection_question/:id_to_remove", { :controller => "reflection_questions", :action => "destroy_row" })

  #------------------------------

  # Routes for the Reflection resource:

  # CREATE
  get("/reflections/new", { :controller => "reflections", :action => "new_form" })
  post("/create_reflection", { :controller => "reflections", :action => "create_row" })

  # READ
  get("/reflections", { :controller => "reflections", :action => "index" })
  get("/reflections/:id_to_display", { :controller => "reflections", :action => "show" })

  # UPDATE
  get("/reflections/:prefill_with_id/edit", { :controller => "reflections", :action => "edit_form" })
  post("/update_reflection/:id_to_modify", { :controller => "reflections", :action => "update_row" })

  # DELETE
  get("/delete_reflection/:id_to_remove", { :controller => "reflections", :action => "destroy_row" })

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "responses#index"
  devise_for :users, controllers: { registrations: 'users/registrations'}
  
  # Routes for SMS testing
  
  get "/send_test_message", :controller => "messages", :action => "send_test_message"
  post "/new_response", :controller => "messages", :action => "new_response"
  post "/sms", :controller => "messages", :action => "new_response"  
  get "/sms", :controller => "messages", :action => "new_response"  
  
  
  
  # Routes for the Response resource:
  # CREATE
  get "/responses/new", :controller => "responses", :action => "new"
  post "/create_response", :controller => "responses", :action => "create"

  # READ
  get "/responses", :controller => "responses", :action => "index"
  get "/responses/:id", :controller => "responses", :action => "show"
  get "/empty", :controller => "responses", :action => "empty"

  # UPDATE
  get "/responses/:id/edit", :controller => "responses", :action => "edit"
  post "/update_response/:id", :controller => "responses", :action => "update"

  # DELETE
  get "/delete_response/:id", :controller => "responses", :action => "destroy"
  #------------------------------

  # Routes for the Question resource:
  # CREATE
  get "/questions/new", :controller => "questions", :action => "new"
  post "/create_question", :controller => "questions", :action => "create"

  # READ
  get "/questions", :controller => "questions", :action => "index"
  get "/questions/:id", :controller => "questions", :action => "show"

  # UPDATE
  get "/questions/:id/edit", :controller => "questions", :action => "edit"
  post "/update_question/:id", :controller => "questions", :action => "update"

  # DELETE
  get "/delete_question/:id", :controller => "questions", :action => "destroy"
  #------------------------------

  # devise_for :users
  # Routes for the User resource:
  # READ
  # get "/users", :controller => "users", :action => "index"
  # get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
