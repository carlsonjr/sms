class ReflectionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def setup
    if ReflectionQuestion.where(:user_id => current_user.id).count > 0
      redirect_to("/new_reflection")
    else
    render("/reflections_prototype/setup.html.erb")
    end
    
  end
  
  def submit_questions
    q1 = params[:question_1]
    q2 = params[:question_2]
    q3 = params[:question_3]
    
    rq1 = ReflectionQuestion.new
    rq1.user_id = current_user.id
    rq1.reflection_question_text = q1
    puts rq1.reflection_question_text
    rq1.save
    
    rq2 = ReflectionQuestion.new
    rq2.user_id = current_user.id
    rq2.reflection_question_text = q2
    puts rq2
    rq2.save
    
    rq3 = ReflectionQuestion.new
    rq3.user_id = current_user.id
    rq3.reflection_question_text = q3
    puts rq3
    rq3.save
    
    @questions = ReflectionQuestion.where(:user_id => current_user.id)
      
      date_to = DateTime.now
      if current_user.last_reflection_on == nil
      date_from = current_user.created_at.to_date
      else
      date_from = current_user.last_reflection_on
      end
      puts date_from
      @responses = Response.where(:user_id => current_user.id, :created_at => date_from.beginning_of_day..date_to.end_of_day).all
  
  redirect_to("/new_reflection")
  
    
  end
  
  def new_reflection
      @questions = ReflectionQuestion.where(:user_id => current_user.id)
      
      date_to = DateTime.now
      if current_user.last_reflection_on == nil
      date_from = current_user.created_at.to_date
      else
      date_from = current_user.last_reflection_on
      end
      puts date_from
      @responses = Response.where(:user_id => current_user.id, :created_at => date_from.beginning_of_day..date_to.end_of_day).all
    
    render("reflections_prototype/new_reflection.html.erb")
  
  end
  
  def submit_reflection
    r = Reflection.new
    r.user_id = current_user.id
    if r.previous_reflection_date == nil
      r.previous_reflection_date = current_user.created_at
    else
      r.previous_reflection_date = User.reflections.last.created_at
    end
    r.save
    
    current_user.last_reflection_on = r.created_at.to_date.in_time_zone(current_user.time_zone)
    current_user.save(validate: false)
    
    q0 = params[:question_id_0]
    a0 = params[:answer_0]
    q1 = params[:question_id_1]
    a1 = params[:answer_1]
    q2 = params[:question_id_2]
    a2 = params[:answer_2]
    
    if a0 != nil
    answer = ReflectionAnswer.new
    answer.reflection_id = r.id
    answer.reflection_question_id = q0
    answer.reflection_answer_text = a0
    answer.save
    end
    
    if a1 != nil
    answer = ReflectionAnswer.new
    answer.reflection_id = r.id
    answer.reflection_question_id = q1
    answer.reflection_answer_text = a1
    answer.save
    end
    
    if a2 != nil
    answer = ReflectionAnswer.new
    answer.reflection_id = r.id
    answer.reflection_question_id = q2
    answer.reflection_answer_text = a2
    answer.save
    end
    
    @reflections = Reflection.where(:user_id => current_user.id)
    redirect_to("/reflections")
  end
  
  

  def index
    @last = current_user.last_reflection_on
    @now = DateTime.now.in_time_zone(current_user.time_zone).to_date
    @range = @now - @last
    @range = @range.to_int
    
    
    @reflections = Reflection.where(:user_id => current_user.id).order(created_at: :desc)
    if @reflections.count == 0
      redirect_to("/new_reflection")
    else
      render("reflection_templates/index.html.erb")
    end
  end


  def edit_form
    @reflection = Reflection.find(params.fetch("prefill_with_id"))
    @questions = current_user.reflection_questions
      
      
      date_to = @reflection.created_at.to_date
      if @reflection.previous_reflection_date == nil
      date_from = current_user.created_at
      else
      date_from = @reflection.previous_reflection_date
      end
      puts date_from
    
    
    @responses = Response.where(:user_id => current_user.id, :created_at => date_from.beginning_of_day..date_to.end_of_day).all
    render("reflections_prototype/update_reflection.html.erb")
  end

  def update_row
    @reflection = Reflection.find(params.fetch("id_to_modify"))

    a_id_0 = params[:answer_id_0]
    a_0 = params[:answer_text_0]
    a_id_1 = params[:answer_id_1]
    a_1 = params[:answer_text_1]
    a_id_2 = params[:answer_id_2]
    a_2 = params[:answer_text_2]
    
    answer0 = ReflectionAnswer.find(a_id_0)
    answer0.reflection_answer_text = a_0

    answer1 = ReflectionAnswer.find(a_id_1)
    answer1.reflection_answer_text = a_1
    
    answer2 = ReflectionAnswer.find(a_id_2)
    answer2.reflection_answer_text = a_2
    
    @reflections = Reflection.where(:user_id => current_user.id)


    if answer0.valid? && answer1.valid? && answer2.valid?
      answer0.save
      answer1.save          
      answer2.save
      
      redirect_to("/reflections", :notice => "Edit successful!")
    else
      render("reflections_prototype/update_reflection.html.erb")
    end
  end















  def create_row
    @reflection = Reflection.new

    @reflection.created_at = params.fetch("created_at")

    if @reflection.valid?
      @reflection.save

      redirect_to("/reflections", :notice => "Reflection created successfully.")
    else
      render("reflection_templates/new_form.html.erb")
    end
  end


















  def show
    @reflection = Reflection.find(params.fetch("id_to_display"))

    render("reflection_templates/show.html.erb")
  end

  def new_form
    render("reflection_templates/new_form.html.erb")
  end





  def destroy_row
    @reflection = Reflection.find(params.fetch("id_to_remove"))

    @reflection.destroy

    redirect_to("/reflections", :notice => "Reflection deleted successfully.")
  end
end
