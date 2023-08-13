# frozen_string_literal: true

class UserRankQuery
  def self.call(user)
    UserRankRecordQuery.call(user).rank
  end
end
