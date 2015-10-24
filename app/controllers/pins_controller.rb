class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  
  def index
    @pins = Pin.all
  end

  #CLIENTSIDE FUNCTION. I am the view that allows users to s read pins. I have  no database function
  def show
  end

  # CLIENTSIDE UI & INTERACTION. I am the page that is displayed for user to create a pin
  def new
    @pin = current_user.pins.build
  end

 # CLIENTSIDE UI & INTERACTION. I am the page that is displayed for user to create a pin
  def edit
  end

  #SERVER SIDE FUNTION. I am the function/java that creates and stores a pin in the database
  def create
    @pin = current_user.pins.build (pin_params)

      if @pin.save
        redirect_to @pin, notice: 'Pin was successfully created.' 
        else
        render :new 
      end
    end
  

 #SERVER SIDE FUNCTION. I am the function/java that updates a pin in the database
 def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render :edit
    end
  end

  # DATABASE FUNCTION. I have no view for the client I am soley a database function 
  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "stop stealing" if @pin.nil?
    end

    
    def pin_params
      params.require(:pin).permit(:description, :image)
    end
  end


