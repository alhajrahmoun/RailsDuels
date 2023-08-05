# frozen_string_literal: true

class RanksQuery
  def self.call(limit: nil, min_points: nil)
    query = User.select("id, username, points, level, RANK() OVER (ORDER BY points DESC) as rank")
    query = query.limit(limit) if limit.present?
    query = query.where("points > ?", min_points) if min_points.present?
    query
  end
end
