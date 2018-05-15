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
        @cohorts = Cohort.all
        # p "COHORTS:"
        # working:
        # render json: @cohorts[0].teacher
        # working:
    #    render json: @cohorts[0].students
        # @students = Student.all
        # render json: @students[0].cohorts
        render json: @cohorts[0].teacher
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
