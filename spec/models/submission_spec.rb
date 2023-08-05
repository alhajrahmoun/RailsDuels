require 'rails_helper'

RSpec.describe Submission, type: :model do
  describe '#set_points' do
    let(:problem) { create(:problem, answer: 'B', points: 5) }

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
  end
end