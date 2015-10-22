class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  #I am the homepage of the crud
  def index
    @pins = Pin.all
  end

  #I am both read and show
  def show
  end

  # I am the ui create function
  def new
    @pin = Pin.new
  end

 # I am the ui of update function
  def edit
  end

  #I am part of the create function. He is the UI. I am the Java
  def create
    @pin = Pin.new(pin_params)

      if @pin.save
        redirect_to @pin, notice: 'Pin was successfully created.' 
        else
        render :new 
      end
    end
  

  
 def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    
    def set_pin
      @pin = Pin.find(params[:id])
    end

    
    def pin_params
      params.require(:pin).permit(:description)
    end
end
