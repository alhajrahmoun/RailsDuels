# frozen_string_literal: true

class UserRankQuery
  def self.call(user_id)
    users_ranks = RanksQuery.call.to_sql

    User.select('*')
        .from("(#{users_ranks}) as users")
        .find_by(id: user_id)
  end
end
