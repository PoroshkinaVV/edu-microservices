require 'bunny'

module Sender
  # DEFAULT_HOST = "amqp://guest:guest@localhost:5672"
  module_function

  def publish(payload)
    connection = Bunny.new(automatically_recover: false)

    connection.start
    channel = connection.create_channel
    queue = channel.queue('pdf_generate')
    channel.default_exchange.publish("#{payload}", routing_key: queue.name)
    puts " [x] Sent 'Hello World!'"

    connection.close
  end

end

