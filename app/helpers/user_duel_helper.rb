# frozen_string_literal: true

module UserDuelHelper
  def duels_table_row_color(duel)
    if duel.winner == current_user
      'table-success'
    elsif !duel.winner.nil?
      'table-danger'
    else
      'table-light'
    end
  end
end
