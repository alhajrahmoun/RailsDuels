class QueueSizeQuery
  def self.call(queue_name)
    User.where(level: queue_name)
        .in_queue
        .count
  end
end