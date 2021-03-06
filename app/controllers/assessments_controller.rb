class AssessmentsController < ApplicationController
  before_filter :authenticate_user!, :only => [:update]
  
  def index
    @assessments = current_or_guest_user.assessments
    render :index
  end

  def show
    @assessment = Assessment.find(params[:id])
    render :show
  end

  def new
    @assessment = Assessment.new
  end
  
  def create
    @assessment = current_or_guest_user.assessments.new(params[:assessment])
    if @assessment.save
      render :json => @assessment
    else
      render :json => @assessment.errors.full_messages, :status => 422
    end
  end

  def edit
    @assessment = Assessment.find(params[:id])
  end
  
  def update
    params[:assessment][:administrator_id] = current_admin.id
    @assessment = Assessment.find(params[:id])
    @assessment.update_attributes(params[:assessment])
    if @assessment.save
      render :json => @assessment
    else
      render :json =>  @assessment.errors.full_messages, :status => 422
    end
  end
  
  def demo
    if current_or_guest_user.guest
      current_or_guest_user.username = "guest"
      current_or_guest_user.save
    end
    
    render :json => current_or_guest_user.assessments
  end
end
