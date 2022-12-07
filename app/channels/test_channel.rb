class TestChannel < ApplicationCable::Channel

    def subscribed
        stream_from "test_channel"
        puts "Listening"
    end


end