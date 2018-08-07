module Bot
  class Job < Plugin
    include Cinch::Plugin

    match(/signon (.+)/, method: :sign_on)
    match(/signoff$/, method: :sign_off)
    match(/job$/, method: :job)
    match(/work$/, method: :job)

    def sign_on(message, option)
      end_point = "job_system/sign_on/#{message.user.nick}/#{option}"
      post_request(end_point)
    end

    def sign_off(message)
      end_point = "job_system/sign_off/#{message.user.nick}"
      post_request(end_point)
    end

    def job(message)
      end_point = "job_system/work/#{message.user.nick}"
      post_request(end_point)
    end

    def show_bonus(message)
      end_point = 'job_system/bonus'
      get_request(end_point)
    end
  end
end