# frozen_string_literal: true

class OnlineUsersQuery
  def self.call
    User.online.count
  end
end
