class QuestionsController < ApplicationController
  before_action :current_user_must_be_question_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_question_user
    question = Question.find(params[:id])

    unless current_user == question.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.questions.ransack(params[:q])
    @questions = @q.result(:distinct => true).includes(:user, :responses).page(params[:page]).per(10)

    render("questions/index.html.erb")
  end

  def show
    @response = Response.new
    @question = Question.find(params[:id])

    render("questions/show.html.erb")
  end

  def new
    @question = Question.new

    render("questions/new.html.erb")
  end

  def create
    @question = Question.new

    @question.user_id = params[:user_id]
    @question.question = params[:question]

    save_status = @question.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/questions/new", "/create_question"
        redirect_to("/questions")
      else
        redirect_back(:fallback_location => "/", :notice => "Question created successfully.")
      end
    else
      render("questions/new.html.erb")
    end
  end

  def edit
    @question = Question.find(params[:id])

    render("questions/edit.html.erb")
  end

  def update
    @question = Question.find(params[:id])
    @question.question = params[:question]

    save_status = @question.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/questions/#{@question.id}/edit", "/update_question"
        redirect_to("/questions/#{@question.id}", :notice => "Question updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Question updated successfully.")
      end
    else
      render("questions/edit.html.erb")
    end
  end

  def destroy
    @question = Question.find(params[:id])

    @question.destroy

    if URI(request.referer).path == "/questions/#{@question.id}"
      redirect_to("/", :notice => "Question deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Question deleted.")
    end
  end
end
