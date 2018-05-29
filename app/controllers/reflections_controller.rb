class ReflectionsController < ApplicationController
  def index
    @reflections = Reflection.all

    render("reflection_templates/index.html.erb")
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
