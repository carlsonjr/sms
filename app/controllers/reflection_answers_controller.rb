class ReflectionAnswersController < ApplicationController
  def index
    @reflection_answers = ReflectionAnswer.all

    render("reflection_answer_templates/index.html.erb")
  end

  def show
    @reflection_answer = ReflectionAnswer.find(params.fetch("id_to_display"))

    render("reflection_answer_templates/show.html.erb")
  end

  def new_form
    render("reflection_answer_templates/new_form.html.erb")
  end

  def create_row
    @reflection_answer = ReflectionAnswer.new

    @reflection_answer.question_id = params.fetch("question_id")
    @reflection_answer.answer_id = params.fetch("answer_id")
    @reflection_answer.answer_text = params.fetch("answer_text")

    if @reflection_answer.valid?
      @reflection_answer.save

      redirect_to("/reflection_answers", :notice => "Reflection answer created successfully.")
    else
      render("reflection_answer_templates/new_form.html.erb")
    end
  end

  def edit_form
    @reflection_answer = ReflectionAnswer.find(params.fetch("prefill_with_id"))

    render("reflection_answer_templates/edit_form.html.erb")
  end

  def update_row
    @reflection_answer = ReflectionAnswer.find(params.fetch("id_to_modify"))

    @reflection_answer.question_id = params.fetch("question_id")
    @reflection_answer.answer_id = params.fetch("answer_id")
    @reflection_answer.answer_text = params.fetch("answer_text")

    if @reflection_answer.valid?
      @reflection_answer.save

      redirect_to("/reflection_answers/#{@reflection_answer.id}", :notice => "Reflection answer updated successfully.")
    else
      render("reflection_answer_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @reflection_answer = ReflectionAnswer.find(params.fetch("id_to_remove"))

    @reflection_answer.destroy

    redirect_to("/reflection_answers", :notice => "Reflection answer deleted successfully.")
  end
end
