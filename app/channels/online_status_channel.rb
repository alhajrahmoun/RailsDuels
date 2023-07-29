class OnlineStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_status"

    if current_user
      current_user.update(online: true)

      broadcast_online_users_count
    end
  end

  def unsubscribed
    if current_user
      current_user.update(online: false)
      broadcast_online_users_count
    end
  end

  private

  def broadcast_online_users_count
    ActionCable.server.broadcast(
      "online_status",
      OnlineUsersQuery.call
    )
  end
end
