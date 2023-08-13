# frozen_string_literal: true

class UserRankRecordQuery
  def self.call(user)
    users_ranks = RanksQuery.call(level: user.level).to_sql

    User.select('*')
        .from("(#{users_ranks}) as users")
        .find_by(id: user.id)
  end
end
