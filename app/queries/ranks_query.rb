# frozen_string_literal: true

class RanksQuery
  def self.call(limit: nil, level: nil)
    query = User.select('*, RANK() OVER (ORDER BY points DESC) as rank').preload(:duels)
    query = query.limit(limit) if limit.present?
    query = query.where(level: level) if level.present?
    query
  end
end
