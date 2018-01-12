# minestat

A port of [minestat](https://github.com/ldilley/minestat)

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  minestat:
    github: unn4m3d/minestat
```

## Usage

Use this [like ruby version](https://github.com/ldilley/minestat/blob/master/Ruby/example.rb), but use `MineStat::Data` instead of `MineStat`. Remember to add `.not_nil!` if necessary

```crystal
require "minestat"

server = MineStat::Data.new "minecraft.dilley.me", 25565
puts "Minecraft server status of #{ms.address} on port #{ms.port}:"
if ms.online
  puts "Server is online running version #{ms.version.not_nil!} with #{ms.current_players.not_nil!} out of #{ms.max_players.not_nil!} players."
  puts "Message of the day: #{ms.motd.not_nil!}"
else
  puts "Server is offline!"
end
```


## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/unn4m3d/minestat/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [unn4m3d](https://github.com/unn4m3d) - creator, maintainer
- [Lloyd Dilley](https://github.com/ldilley) - author of the original minestat
