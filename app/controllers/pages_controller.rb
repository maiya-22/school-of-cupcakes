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
            # session[:does_not_exist_error] = true
            flash[:user_error] = "THAT USER NAME OR PASSWORD DOES NOT MATCH"
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
