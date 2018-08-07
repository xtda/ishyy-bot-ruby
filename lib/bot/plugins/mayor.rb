module Bot
  class Mayor < Plugin
    include Cinch::Plugin

    match(/transfer (.+)/, method: :transfer)
    match(/mayorgive (.+)/, method: :transfer)
    match(/vote (.+)/, method: :vote)
    match(/mayor$/, method: :mayor)
    match(/settax (.+)/, method: :settax)
    match(/setbonus (.+)/, method: :set_bonus)
    match(/funds$/, method: :funds)
    match(/tax$/, method: :tax)
    
    def transfer(message, option)
      give_to = option.split(' ')[0]
      amount = option.split(' ')[1]

      end_point = "mayor_system/transfer/#{message.user.nick}/#{give_to}/#{amount}"
      post_request(end_point)
    end

    def vote(message, option)
      end_point = "mayor_system/vote/#{message.user.nick}/#{option}"
      post_request(end_point)
    end

    def mayor(message)
      end_point = 'mayor_system/current'
      get_request(end_point)
    end

    def funds(message)
      end_point = 'mayor_system/funds'
      get_request(end_point)
    end

    def tax(message)
      end_point = 'mayor_system/tax'
      get_request(end_point)
    end

    def settax(message, option)
      end_point = "mayor_system/tax/#{message.user.nick}/#{option}"
      post_request(end_point)
    end

    def set_bonus(message, option)
      job_code = option.split(' ')[0]
      amount = option.split(' ')[1]

      end_point = "mayor_system/job_bonus/#{message.user.nick}/#{job_code}/#{amount}"
      post_request(end_point)
    end
  end
end
