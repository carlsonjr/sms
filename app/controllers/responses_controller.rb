class ResponsesController < ApplicationController
  before_action :current_user_must_be_response_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_response_user
    response = Response.find(params[:id])
    unless current_user == response.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.responses.ransack(params[:q])
    if Question.where(:user_id => current_user.id).count == 0
      question = Question.new
      question.user_id = current_user.id
      question.save
    end
    
    @responses = @q.result(:distinct => true).includes(:user, :question).order(created_at: :desc).page(params[:page]).per(10)
    if @responses.count >0 
      
    render("responses/index.html.erb")
    else
      render("responses/empty.html.erb")
    end
  end
  
  def empty
    @q = current_user.responses.ransack(params[:q])
    render("responses/empty.html.erb")
  end

  def show
    @response = Response.find(params[:id])

    render("responses/show.html.erb")
  end

  def new
    @response = Response.new

    render("responses/new.html.erb")
  end

  def create
    @response = Response.new

    @response.user_id = params[:user_id]
    @response.question_id = params[:question_id]
    @response.time = params[:time]
    @response.response_text = params[:response_text]

    save_status = @response.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/responses/new", "/create_response"
        redirect_to("/responses")
      else
        redirect_back(:fallback_location => "/", :notice => "Response created successfully.")
      end
    else
      render("responses/new.html.erb")
    end
  end

  def edit
    @response = Response.find(params[:id])

    render("responses/edit.html.erb")
  end

  def update
    @response = Response.find(params[:id])
    @response.question_id = params[:question_id]
    @response.time = DateTime.now
    @response.response_text = params[:response_text]

    save_status = @response.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/responses/#{@response.id}/edit", "/update_response"
        redirect_to("/", :notice => "Response updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Response updated successfully.")
      end
    else
      redirect_to("/")
    end
  end

  def destroy
    @response = Response.find(params[:id])

    @response.destroy

    if URI(request.referer).path == "/responses/#{@response.id}"
      redirect_to("/", :notice => "Response deleted.")
    elsif URI(request.referer).path == "/responses/#{@response.id}/edit"
      redirect_to("/", :notice => "Response deleted.")    
    else
      redirect_back(:fallback_location => "/", :notice => "Response deleted.")
    end
  end
  
  
  def print
    
    
    @responses = Response.where(:user_id => current_user.id).all.order(created_at: :desc)
    date_to  = DateTime.now.to_date
    date_from    = @responses.first.created_at.to_date
    date_range = date_from..date_to
    @dates_array = (date_range).map(&:to_s)
    puts @dates_array
    render("/responses/print.html.erb")
    
    
  end
end
