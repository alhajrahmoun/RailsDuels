class RanksQuery
  def self.call(limit: nil)
    query = User.select("id, username, points, level, RANK() OVER (ORDER BY points DESC) as rank")
    query = query.limit(limit) if limit.present?
    query
  end
end