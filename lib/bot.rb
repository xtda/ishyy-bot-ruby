require 'rubygems'
require 'bundler/setup'
require 'cinch'
require 'typhoeus'

module Bot
  require_relative 'bot/plugin.rb'

  Dir['./lib/bot/plugins/*.rb'].each { |p| require p }

  bot = Cinch::Bot.new do
    configure do |c|
      c.server = 'irc.chat.twitch.tv'
      c.port = 6667
      c.channels = ['#xtda616']
      c.plugins.plugins = Plugin.plugins
      c.password = ENV['ISHYYTWITCHOAUTH']
    end
  end

  bot.start
end
