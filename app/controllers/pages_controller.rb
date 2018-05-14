class PagesController < ApplicationController
    layout "application"
    def index
    end

    
    def index_string
        render :index, :layout => false
    end
end
