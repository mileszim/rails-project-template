module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    identified_by :session_id

    def connect
      self.current_user = user_from_request(request) # || reject_unauthorized_connection
      self.session_id = request.uuid
      reject_unauthorized_connection unless self.current_user || self.session_id
    end

    private

    def user_from_request(request)
      User.find_by(id: request.session.fetch("user_id", nil))
    end
  end
end
