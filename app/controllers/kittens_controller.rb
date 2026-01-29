class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |f|
      f.html
      f.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find params[:id]

    respond_to do |f|
      f.html
      f.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to @kitten, notice: "Congrats on adding new kitten!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find params[:id]
  end


  def update
    @kitten = Kitten.find params[:id]

    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: "Kitten is updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find params[:id]
    @kitten.destroy
    redirect_to :root, notice: "Oh, no.. What did you do!?"
  end

  private

  def kitten_params
    params.expect kitten: [:name, :age, :cuteness, :softness]
  end
end
