# frozen_string_literal: true

class RanksQuery
  def self.call(limit: nil, min_points: nil, level: nil)
    query = User.select('*, RANK() OVER (ORDER BY points DESC) as rank')
    query = query.limit(limit) if limit.present?
    query = query.where('points >= ?', min_points) if min_points.present?
    query = query.where(level: level) if level.present?
    query
  end
end
