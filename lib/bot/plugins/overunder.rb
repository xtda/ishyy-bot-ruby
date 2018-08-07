module Bot
  class Overunder < Plugin
    include Cinch::Plugin

    match(/ou (.+)/)
    match(/overunder (.+)/)
    def execute(message, option)
      choice = option.split(' ')[0]
      amount = option.split(' ')[1]

      end_point = "overunder/#{message.user.nick}/#{choice}/#{amount}"
      post_request(end_point)
    end
  end
end
