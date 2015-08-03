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

    def enforce_login(params_user_id, redirect_url)
        unless current_user && authorized(params_user_id)
            redirect_to redirect_url
        end
    end

    def authorized(params_user_id)
        current_user.id == params_user_id
    end

end