module Bot
  class Tax < Plugin
    include Cinch::Plugin
    
    listen_to :message
    def listen(message)
      return unless message.user.nick == 'streamelements'
      parse_message = message.message.split(' ')
      if parse_message[3] =~ /\d/ || parse_message[8] =~ /\d/ || parse_message[12] =~ /\d/ 
        handle_tax(parse_message)
      end
    end

    def handle_tax(parse_message)
      if parse_message[2].eql?('won')
        name = parse_message[1]
        win = parse_message[3]
        tax_win(name, win)
      elsif parse_message[1].eql?('PogChamp')
        name = parse_message[2]
        win = parse_message[8]
        tax_win(name, win)
      elsif parse_message[2].eql?('lost')
        win = parse_message[3].to_i * 0.05
        add_funds(win.to_i)
      elsif parse_message[3].eql?('all') && parse_message[6].eql?('lost')
        win = parse_message[12].to_i * 0.05
        add_funds(win.to_i)
      end
    end

    def tax_win(name, win)
      end_point = "tax/pay_tax/#{name}/#{win}"
      post_request(end_point)
    end

    def add_funds(win)
      end_point = "mayor_system/funds/add/xtda616/#{win}"
      post_request(end_point)
    end
  end
end
