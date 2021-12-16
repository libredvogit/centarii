#!/usr/bin/env ruby

require "discordrb"

# Read from configuration
# - make sure Config is of Hash
eval File.read "./config.rb"

bot = Discordrb::Commands::CommandBot.new token: Config["token"], client_id: Config["clientID"], intents: [:server_messages]

bot.message with_text: ".ping" do |event|
    m = event.respond "pong ..."
    m.edit "pong #{Time.now - event.timestamp}s"
end

bot.run
