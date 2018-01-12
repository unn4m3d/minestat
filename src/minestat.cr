require "./minestat/*"
require "socket"
require "timeout"

# TODO: Write documentation for `Minestat`
module MineStat
  class Data
    NUM_FIELDS = 6

    property online : Bool = false
    property motd : String? = nil
    property players : UInt32? = nil
    property max_players : UInt32? = nil
    property version : String? = nil
    property address : String
    property port : UInt32
    property status = "OK"

    def initialize(@address, @port, timeout = 7)
      begin
        data = ""
        result = Timeout.timeout(timeout.to_f64) do
          TCPSocket.open(@address, @port) do |socket|
            socket << "\xFE\x01"
            data = socket.gets
          end
        end
        @status = "Timeout" unless result

        if data.nil? || data.not_nil!.empty?
          @status = "Empty response"
        else
          info = data.not_nil!.split "\x00\x00\x00"
          if info.size < NUM_FIELDS
            @status = "Invalid response"
          else
            @online = true
            @version = info[2].gsub("\u0000", "")
            @motd = info[3].gsub("\u0000", "")
            @players = info[4].gsub("\u0000", "").to_u32
            @max_players = info[5].gsub("\u0000", "").to_u32
          end
        end
      rescue e
        @status = e.to_s
      end
    end
  end
end
