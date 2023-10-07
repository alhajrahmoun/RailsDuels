# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Problem do
  describe '#answer_matches_choice' do
    let(:problem) { create(:problem, choices: %w[1 2 3 4], answer: '1') }

    it 'is valid when answer is one of the choices' do
      expect(problem).to be_valid
    end

    it 'is invalid when answer is not one of the choices' do
      problem.answer = '5'

      expect(problem).not_to be_valid
    end
  end

  describe '#choices_count' do
    let(:problem) { create(:problem, choices: %w[1 2 3 4], answer: '1') }

    it 'is valid when choices count is between 2 and 4' do
      expect(problem).to be_valid
    end

    it 'is invalid when choices count is less than 2' do
      problem.choices = %w[1]

      expect(problem).not_to be_valid
    end

    it 'is invalid when choices count is more than 4' do
      problem.choices = %w[1 2 3 4 5]

      expect(problem).not_to be_valid
    end
  end
end