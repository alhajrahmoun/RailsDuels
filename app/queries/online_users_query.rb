class OnlineUsersQuery
  def self.call
    User.online.count
  end
end
