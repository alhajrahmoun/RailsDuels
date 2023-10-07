# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Duel do
  describe '#initial_state' do
    let(:duel) { create(:duel) }

    it 'returns the initial state of a duel' do
      state = duel.initial_state
      expect(state.points).to eq(0)
      expect(state.submissions).to eq(0)
      expect(state.correct_answers).to eq(0)
    end
  end

  describe '#user_state' do
    let!(:duel) { create(:duel) }
    let(:users) { duel.users }
    let(:user) { users.first }
    let!(:submissions) { create_list(:submission, 3, user: user, duel: duel) }

    before { duel.submissions.reload }

    it 'returns the current state for a given user' do
      state = duel.user_state(user)

      expect(state.points).to eq(30)
      expect(state.submissions).to eq(3)
      expect(state.correct_answers).to eq(3)
    end
  end
end
