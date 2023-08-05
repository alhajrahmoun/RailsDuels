# frozen_string_literal: true

class OnlineStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'online_status'

    return unless current_user

    current_user.update(online: true)
    broadcast_online_users_count
  end

  def unsubscribed
    return unless current_user

    current_user.update(online: false)
    broadcast_online_users_count
  end

  private

  def broadcast_online_users_count
    ActionCable.server.broadcast(
      'online_status',
      OnlineUsersQuery.call
    )
  end
end
