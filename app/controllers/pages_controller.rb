class PagesController < ApplicationController
    skip_before_action :verify_authenticity_token  
    
    layout "application"
    def index
        
    end

    def index_string
        render :index, :layout => false
    end

    def sign_in
        # note: secret password not working
        # note: trying to use where with strong params not working:
        @access = Access.where(user_name: params[:user_name], password: params[:password])[0]
        if(@access == nil)
            flash[:user_error] = "That user name or password does not match"
        else
            set_session(@access)
        end
        p "ACCESS"
        p @access
        redirect_to action: 'index'

    end

    def sign_out
        clear_session
        flash[:good_bye] = "Good 'bye!"
        redirect_to action: 'index'
    end

    # note: trying to use where with strong params not working:
    def password_hint
        @access = Access.where(user_name: params[:user_name])[0]
        if(@access == nil)
            render plain: "can't find a user by that name"
        else
            if(@access.hint == nil)
                render plain: "there is no hint yet"
            else
                render plain: @access.hint
            end
        end
    end

    # use this route to log errors with rollbar:
    # trigger test w/ postman:
    def tests
        # ******************************************************************
        # listing all of the cohorts of a particular course:
        #  @courses = Course.all
        #  render json: @courses[0].cohorts
        # ******************************************************************
        # getting all of the students from a particular cohort:
        # @cohorts = Cohort.all
        # render json: @cohorts[0].students
        # ******************************************************************
        # getting the teacher of a cohort:
        # @cohorts = Cohort.all
        # render json: @cohorts[0].teacher
        # ******************************************************************
        # getting the cohorts that a student is taking:
        # @students = Student.all
        # render json: @students[0].cohorts
        # ******************************************************************
        # adding a teacher to a cohort:
        @info = {}
        @teacher = Teacher.where(id: 1)[0]
        @info["thisteacher"] = @teacher
        @cohort = Cohort.where(id: 2)[0]
        @info["previousteacher"] = @cohort.teacher
        @cohort.teacher = @teacher
        @info["newcohortstatus"] = @cohort
        @info["newteacher"] = @cohort.teacher
        render json: @info
        # render plain: "testing route"
    end

    private

    def set_session(access)
        session[:id] = access.id
        session[:user_name] = access.user_name
        session[:clearance] = access.role
    end

    def clear_session
        session[:id] = nil
        session[:user_name] = nil
        session[:clearance] = nil
    end

    # note:  why is it not allowing me to require more than one attribute?
    def access_params
        # params.permit(:user_name, :password)
    end
end
