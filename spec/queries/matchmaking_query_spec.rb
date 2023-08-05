require 'rails_helper'

RSpec.describe MatchmakingQuery do
  let!(:user) { create(:user, status: :in_queue, level: 'beginner') }
  let!(:matching_user) { create(:user, status: :in_queue, level: 'beginner') }
  let!(:not_matching_user) { create(:user, status: :in_queue, level: 'intermediate') }

  describe '.call' do
    it 'returns a user at the same level who is in queue and is not the current user' do
      result = MatchmakingQuery.call(user)

      expect(result).to eq(matching_user)
      expect(result).not_to eq(not_matching_user)
      expect(result).not_to eq(user)
    end
  end
end