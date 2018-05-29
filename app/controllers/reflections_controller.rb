class ReflectionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def setup
    render("/reflections_prototype/setup.html.erb")
    
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
      date_from = DateTime.now - 10
    @responses = Response.where(:user_id => current_user.id, :created_at => date_from.beginning_of_day..date_to.end_of_day).all
    puts @questions
    render("reflections_prototype/new_reflection.html.erb")  

  end
  
  def new_reflection
      @questions = ReflectionQuestion.where(:user_id => current_user.id)
      date_to = DateTime.now
      date_from = DateTime.now - 10
      
      @responses = Response.where(:user_id => current_user.id, :created_at => date_from.beginning_of_day..date_to.end_of_day).all
    
    render("reflections_prototype/new_reflection.html.erb")
  
  end
  
  def submit_reflection
    r = Reflection.new
    r.user_id = current_user.id
    r.save
    
    q0 = params[:question_id_0]
    a0 = params[:answer_0]
    q1 = params[:question_id_1]
    a1 = params[:answer_1]
    q2 = params[:question_id_2]
    a2 = params[:answer_2]
    
    answer = ReflectionAnswer.new
    answer.reflection_id = r.id
    answer.reflection_question_id = q0
    answer.reflection_answer_text = a0
    answer.save
    
    answer = ReflectionAnswer.new
    answer.reflection_id = r.id
    answer.reflection_question_id = q1
    answer.reflection_answer_text = a1
    answer.save
    
    answer = ReflectionAnswer.new
    answer.reflection_id = r.id
    answer.reflection_question_id = q2
    answer.reflection_answer_text = a2
    answer.save
    
    @reflections = Reflection.where(:user_id => current_user.id)
    render("/reflection_templates/index.html.erb")
  end
  
  

  def index
    
    @reflections = Reflection.where(:user_id => current_user.id)
    if @reflections.count == 0
      redirect_to("/new_reflection")
    else
      render("reflection_templates/index.html.erb")
    end
  end

  def show
    @reflection = Reflection.find(params.fetch("id_to_display"))

    render("reflection_templates/show.html.erb")
  end

  def new_form
    render("reflection_templates/new_form.html.erb")
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

  def edit_form
    @reflection = Reflection.find(params.fetch("prefill_with_id"))

    render("reflection_templates/edit_form.html.erb")
  end

  def update_row
    @reflection = Reflection.find(params.fetch("id_to_modify"))

    @reflection.created_at = params.fetch("created_at")

    if @reflection.valid?
      @reflection.save

      redirect_to("/reflections/#{@reflection.id}", :notice => "Reflection updated successfully.")
    else
      render("reflection_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @reflection = Reflection.find(params.fetch("id_to_remove"))

    @reflection.destroy

    redirect_to("/reflections", :notice => "Reflection deleted successfully.")
  end
end
