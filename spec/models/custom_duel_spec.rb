# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomDuel do
  describe '#time_to_start' do
    let(:custom_duel) { create(:custom_duel, start_at: 20.seconds.from_now) }

    it 'returns the time to start' do
      expect(custom_duel.time_to_start).to eq(20)
    end
  end
end
