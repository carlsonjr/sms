class ReflectionQuestionsController < ApplicationController
  def index
    @reflection_questions = ReflectionQuestion.all

    render("reflection_question_templates/index.html.erb")
  end

  def show
    @reflection_question = ReflectionQuestion.find(params.fetch("id_to_display"))

    render("reflection_question_templates/show.html.erb")
  end

  def new_form
    render("reflection_question_templates/new_form.html.erb")
  end

  def create_row
    @reflection_question = ReflectionQuestion.new

    @reflection_question.user_id = params.fetch("user_id")
    @reflection_question.question_text = params.fetch("question_text")

    if @reflection_question.valid?
      @reflection_question.save

      redirect_to("/reflection_questions", :notice => "Reflection question created successfully.")
    else
      render("reflection_question_templates/new_form.html.erb")
    end
  end

  def edit_form
    @reflection_question = ReflectionQuestion.find(params.fetch("prefill_with_id"))

    render("reflection_question_templates/edit_form.html.erb")
  end

  def update_row
    @reflection_question = ReflectionQuestion.find(params.fetch("id_to_modify"))

    @reflection_question.user_id = params.fetch("user_id")
    @reflection_question.question_text = params.fetch("question_text")

    if @reflection_question.valid?
      @reflection_question.save

      redirect_to("/reflection_questions/#{@reflection_question.id}", :notice => "Reflection question updated successfully.")
    else
      render("reflection_question_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @reflection_question = ReflectionQuestion.find(params.fetch("id_to_remove"))

    @reflection_question.destroy

    redirect_to("/reflection_questions", :notice => "Reflection question deleted successfully.")
  end
end
