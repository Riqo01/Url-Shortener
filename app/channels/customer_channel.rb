class CustomerChannel < ApplicationCable::Channel
  def subscribed
    byebug
    stream_from "customer_channel"

    puts "Streaming"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
