# frozen_string_literal: true

class CustomDuelRanksQuery
  def self.call(duel)
    users_points = duel.submissions
                       .joins(:user)
                       .select('username, user_id as id, SUM(submissions.points) as points')
                       .group(:user_id, :username)
                       .to_sql

    User.select('*, points, RANK() OVER (ORDER BY (points) DESC) as rank')
        .from("(#{users_points}) as users_points")
  end
end
