class HomeController < ApplicationController

    def index
        @instagram = Instagram.user_recent_media("user_id_here", {:count => 1})
    end

    end


    #https://www.instagram.com/oauth/authorize/?client_id=