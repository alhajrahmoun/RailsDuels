# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProblemSet do
  describe '#detailed_name' do
    let(:problem_set) { create(:problem_set, name: 'Problem Set', complexity: :beginner) }

    it 'returns the name and complexity of the problem set' do
      expect(problem_set.detailed_name).to eq('Problem Set (beginner)')
    end
  end
end