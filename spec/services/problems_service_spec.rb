# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProblemsService, type: :service do
  describe '.call' do
    let(:duel) { create(:duel) }
    let(:complexity) { :beginner }
    let(:problem_set) { create(:problem_set, complexity: complexity) }
    let!(:problems) { create_list(:problem, 10, problem_set: problem_set) }

    it 'assigns 5 random problems to the duel' do
      described_class.call(duel: duel, complexity: complexity)

      expect(duel.problems.count).to eq(5)
      expect(duel.problems.ids).to match_array(duel.problems.ids.uniq)
    end
  end
end
