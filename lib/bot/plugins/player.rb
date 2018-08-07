module Bot
  class Player < Plugin
    include Cinch::Plugin

    match(/id$/)
    def execute(message)
      end_point = "player/#{message.user.nick}"
      get_request(end_point)
    end
  end
end
