# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DuelParticipant do
  describe '#participants_count' do
    let(:duel) { create(:custom_duel) }

    it 'is valid when participants count is less than or equal to MAX_PARTICIPANTS' do
      create_list(:duel_participant, 5, duel: duel)

      expect(build(:duel_participant, duel: duel)).to be_valid
    end

    it 'is invalid when participants count is more than MAX_PARTICIPANTS' do
      # We already have two participants from the factory
      create_list(:duel_participant, 18, duel: duel)

      expect(build(:duel_participant, duel: duel)).not_to be_valid
    end
  end
end
