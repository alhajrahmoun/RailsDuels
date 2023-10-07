# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomDuelRanksQuery do
  describe '.call' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:duel) { create(:custom_duel) }
    let(:problem) { create(:problem, choices: %w[A B C], answer: 'B', points: 10) }

    let!(:submission1) { create(:submission, user: user1, problem: problem, duel: duel, choice: 'B') }
    let!(:submission2) { create(:submission, user: user2, problem: problem, duel: duel, choice: 'B') }

    it 'returns a list of users with their points and rank' do
      result = described_class.call(duel)
      result_array = result.to_a

      expect(result.size).to eq(2)
      expect(result_array.first).to have_attributes(id: user1.id, points: 11, rank: 1)
      expect(result_array.second).to have_attributes(id: user2.id, points: 10, rank: 2)
    end
  end
end
