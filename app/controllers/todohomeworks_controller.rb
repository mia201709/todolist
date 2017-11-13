class TodohomeworksController < ApplicationController
  before_action :set_todohomework, :only => [:edit, :update, :destroy]

  def index
    @todohomeworks = Todohomework.all
  end

  def new
    @todohomework=Todohomework.new
  end

  def create
    @todohomework = Todohomework.new(todohomework_params)
    if @todohomework.save
       redirect_to todohomeworks_url
    else
       render  :action => :new
    end
  end


  def update
    if @todohomework.update_attributes(todohomework_params)
       redirect_to todohomeworks_url(@todohomework)
     else
      render :action => :edit
    end
  end

  def destroy
    if Date.today <= @todohomework.date
      @todohomework.destroy
      flash[:alert] = 'List was successfully deleted !!'
      redirect_to todohomeworks_url
    else
      flash[:alert] = 'List is overdue, can not be deleted !!'
      redirect_to todohomeworks_url
    end
  end

  private

  def set_todohomework
    @todohomework = Todohomework.find(params[:id])
  end

  def todohomework_params
      params.require(:todohomework).permit(:description, :date)
  end


end
