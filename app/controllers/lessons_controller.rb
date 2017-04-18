  class LessonsController < ApplicationController

  def index
    @lesson = Lesson.new
    @hoursTotal = 0
    Lesson.all.each do |l|
     @hoursTotal += l.duration
    end
    @hoursTotal = space_on @hoursTotal /60


    if params[:month]
      @lessons = Lesson.where( :month => params[:month], :year => params[:year] )
    else
      @lessons = Lesson.all
    end

    @lessons = @lessons.order('year DESC').order('month DESC').order('day DESC').order('created_at DESC')
    # @lessons = @lessons.order('created_at DESC')

    @nbrHeures = 0
    @totalFnb = 0
    @totalTransport = 0
    @totalBrut = 0

    @lessons.each do |l|
      @nbrHeures += l.duration
      @totalFnb += l.fnb
      @totalTransport += l.transport
      @totalBrut += l.income
    end

    @nbrHeures = @nbrHeures / 60
    @totalCost = @totalFnb + @totalTransport
    @totalNet = @totalBrut - @totalCost
    if @nbrHeures != 0
       @netHoraire = @totalNet / @nbrHeures
    else
      @netHoraire = 0
    end

  end

  def new
    @lesson = Lesson.new
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      flash[:message] = "Lesson edited !"
      redirect_to lessons_path
    else
      flash[:error] = "Could not update the lesson !"
      render 'edit'
    end
  end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      flash[:message] = "New lesson saved !"
      redirect_to lessons_path
    else
      flash[:error] = "Error, lesson not saved !"
      redirect_to lessons_path
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to lessons_path
  end

  private
    def lesson_params
      params.require(:lesson).permit(:day, :month, :year, :student, :location, :duration, :income, :fnb, :transport, :duration)
    end

end
