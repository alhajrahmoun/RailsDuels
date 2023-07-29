class UserRankQuery
  def self.call(user_id)
    User.select("id, points, RANK() OVER (ORDER BY points DESC) as rank")
        .from("(SELECT id, points, RANK() OVER (ORDER BY points DESC) as rank FROM users) as users")
        .where(id: user_id)
        .first
  end
end