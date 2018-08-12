module Bot
  class Weather < Plugin
    include Cinch::Plugin

    match(/weather (.+)/)
    def execute(message, option)
      end_point = "weather/#{option}"
      get_request(end_point)
    end
  end
end
