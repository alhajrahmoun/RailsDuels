# frozen_string_literal: true

module DuelHelper
  def duel_progress(correct_answers:, points:, answered_questions:)
    step = 20
    correct_answers_percentage = correct_answers * step
    wrong_answers_percentage = (answered_questions - correct_answers) * step
    remaining_percentage = 100 - correct_answers_percentage - wrong_answers_percentage

    content_tag(:div, class: 'progress border border-dark') do
      content_tag(:div, "#{points} #{'Point'.pluralize(points)}", class: 'progress-bar bg-success',
                                                                  style: "width: #{correct_answers_percentage}%") +
        content_tag(:div, '', class: 'progress-bar bg-danger progress-bar-stripped',
                              style: "width: #{wrong_answers_percentage}%") +
        content_tag(:div, '', class: 'progress-bar bg-white', style: "width: #{remaining_percentage}%")
    end
  end

  def custom_duel_progress(problems_count:, correct_answers:, points:, answered_questions:)
    step = 100.0 / problems_count
    correct_answers_percentage = correct_answers * step
    wrong_answers_percentage = (answered_questions - correct_answers) * step
    remaining_percentage = 100 - correct_answers_percentage - wrong_answers_percentage

    content_tag(:div, class: 'progress border border-dark') do
      content_tag(:div, "#{points} #{'Point'.pluralize(points)}", class: 'progress-bar bg-success',
                  style: "width: #{correct_answers_percentage}%") +
        content_tag(:div, '', class: 'progress-bar bg-danger progress-bar-stripped',
                    style: "width: #{wrong_answers_percentage}%") +
        content_tag(:div, '', class: 'progress-bar bg-white', style: "width: #{remaining_percentage}%")
    end
  end
end
