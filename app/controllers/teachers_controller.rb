class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
skip_before_action :verify_authenticity_token  
  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all
  end

  def all
    # note: why won't it let you loop through these objects and add some property before sending back to DOM?
     render json: Teacher.all
    end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    # @teacher = params[:id]
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

   # CUSTOM ROUTE:
  # ADD A TEACHER TO A COHORT, and then view the teacher:
  # PATCH /teacher/:id/course
  def add_to_cohort

    # @teacher = Teacher.where(id: params[:id])[0]
    # @cohort = Cohort.where(id: params[:cohort_id])[0]
    # @info["previousteacher"] = @cohort.teacher
    # @cohort.teacher = @teacher
    # @info["newcohortstatus"] = @cohort
    # @info["newteacher"] = @cohort.teacher
    # render json: @info



    p "**********PARAMS**************"
    p params
    @cohort = Cohort.find_by_id(params[:cohort_id])
    @teacher = Teacher.find_by_id(params[:id])
    @cohort.update_attributes(teacher_id: @teacher.id)

    # render json: @cohort
    redirect_to action: "show", id: params[:id]
  end


  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :profile, :age, :education, :salary)
    end
end
