#!/usr/bin/env ruby

require "discordrb"

eval File.read "./config.rb"

@bot = Discordrb::Commands::CommandBot.new token: Config[0], client_id: Config[1]

# bot.register_application_command :example "Commands", ser

@bot.message with_text: "/ping" do |event|
    m = event.respond "pong ..."
    m.edit "pong #{Time.now - event.timestamp}s"
end

@bot.run
