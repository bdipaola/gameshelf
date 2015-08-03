module LoginHelper
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def find_user(username)
        User.find_by(username: username)
    end

    def login(user)
        session[:user_id] = user.id
    end

    def logout
        session[:user_id] = nil
    end

    def enforce_login(current_url, redirect_url)
        unless current_user # && authorized(current_url)
            redirect redirect_url
        end
    end
end