require 'bunny'
require './lib/pdf_generator'

module Receiver

  def self.start
    connection = Bunny.new(automatically_recover: false)
    connection.start

    channel = connection.create_channel
    queue = channel.queue('pdf_generate')

    begin
      puts ' [*] Waiting for messages. To exit press CTRL+C'
      queue.subscribe(block: true) do |_delivery_info, _properties, payload|
        PdfGenerator.generate(payload)
        puts "[x] Payload Received"
      end
    rescue Interrupt => _
      connection.close

      exit(0)
    end
  end
end
