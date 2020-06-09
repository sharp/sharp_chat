module ApplicationCable
  class Connection < ActionCable::Connection::Base
    rescue_from StandardError, with: :report_error
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      if verified_user = User.find_by(username: request.headers["AUTHORIZATION"])
        verified_user
      else
        reject_unauthorized_connection
      end
    end

    def report_error(e)
      puts "There is something wrong!"
    end
  end
end
