# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Submission do
  describe '#set_points' do
    let(:problem) { create(:problem, choices: %w[A B C], answer: 'B', points: 5) }

    it 'successfully sets points to problem points if answer is correct' do
      submission = build(:submission, choice: 'B', problem: problem)
      submission.save

      expect(submission.points).to eq(5)
    end

    it 'sets points to zero if answer is wrong' do
      submission = build(:submission, choice: 'C', problem: problem)
      submission.save

      expect(submission.points).to eq(0)
    end

    context 'with extra points when the duel is custom' do
      let(:duel) { create(:custom_duel) }
      let(:problem) { create(:problem, choices: %w[A B C], answer: 'B', points: 5) }

      it 'sets extra points if it is the first submission' do
        submission = build(:submission, choice: 'B', problem: problem, duel: duel)
        submission.save

        expect(submission.points).to eq(6)
      end

      it 'does not set extra points if it is not the first submission' do
        create(:submission, choice: 'B', problem: problem, duel: duel)
        submission = build(:submission, choice: 'B', problem: problem, duel: duel)
        submission.save

        expect(submission.points).to eq(5)
      end
    end
  end
end
