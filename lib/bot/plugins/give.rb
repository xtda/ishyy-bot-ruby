module Bot
  class Give < Plugin
    include Cinch::Plugin

    match(/give (.+)/)
    def execute(message, option)
      give_to = option.split(' ')[0]
      amount = option.split(' ')[1]

      end_point = "give/#{message.user.nick}/#{give_to}/#{amount}"
      post_request(end_point)
    end
  end
end
