class CohortsController < ApplicationController
  before_action :set_cohort, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token 
  # GET /cohorts
  # GET /cohorts.json
  def index
    # p Teacher.find_by_id(1)
    # p "COHORT ______"
    # p Cohort.find_by_id(1).teacher
    @teacher = Teacher
    @cohorts = Cohort.all
  end

  def all
    @cohorts = Cohort.all
    render :all, :layout => false
  end

  # GET /cohorts/1
  # GET /cohorts/1.json
  def show
  end

  # GET /cohorts/new
  def new
    @cohort = Cohort.new
  end

  # GET /cohorts/1/edit
  def edit
  end

  # POST /cohorts
  # POST /cohorts.json
  def create
    @cohort = Cohort.new(cohort_params)

    respond_to do |format|
      if @cohort.save
        format.html { redirect_to @cohort, notice: 'Cohort was successfully created.' }
        format.json { render :show, status: :created, location: @cohort }
      else
        format.html { render :new }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # note: would you edit associations here?
  # PATCH/PUT /cohorts/1
  # PATCH/PUT /cohorts/1.json
  def update
    respond_to do |format|
      if @cohort.update(cohort_params)
        format.html { redirect_to @cohort, notice: 'Cohort was successfully updated.' }
        format.json { render :show, status: :ok, location: @cohort }
      else
        format.html { render :edit }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cohorts/1
  # DELETE /cohorts/1.json
  def destroy
    @cohort.destroy
    respond_to do |format|
      format.html { redirect_to cohorts_url, notice: 'Cohort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # CUSTOM ROUTE:
  # removing a student from a cohort, but not deleting the student:
  def remove_student
    @student =  Student.find_by_id(params[:student_id])
    @cohort = Cohort.find_by_id(params[:cohort_id])
    if(@student != nil && @cohort != nil)
      @cohort.students.delete(@student)
    end
    # how to set message and text on response here?
    render plain: "attempted to delete student from course"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohort
      @cohort = Cohort.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cohort_params
      params.require(:cohort).permit(:name, :start, :end, :teacher_id, :course_id)
    end
end
