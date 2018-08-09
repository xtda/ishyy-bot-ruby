module Bot
  class Plugin
    require 'json'
    require 'oj'

    include Cinch::Plugin

    API_HOST = 'http://localhost:3000/v1/streamelements'.freeze

    def self.plugins
      @plugins ||= []
    end

    def self.inherited(subclass)
      @plugins ||= []

      @plugins << subclass
    end

    def get_request(end_point)
      end_point = "#{API_HOST}/#{end_point}"
      puts "API: #{end_point}"
      request = Typhoeus::Request.new(
        end_point,
        method: :get,
        followlocation: true,
        accept_encoding: 'gzip'
      )
      request.on_complete do |response|
        if response.success?
          return JSON.parse(response.response_body)
        else
          return false
        end
      end
      request.run
    end

    def put_request(end_point)
      end_point = "#{API_HOST}/#{end_point}"
      request = Typhoeus::Request.new(
        end_point,
        method: :put,
        headers: { Authorization: "Bearer #{jwt_token}" },
        followlocation: true,
        accept_encoding: 'gzip'
      )
      request.on_complete do |response|
        if response.success?
          return JSON.parse(response.response_body)
        else
          return false
        end
      end
      request.run
    end
  
    def post_request(end_point)
      end_point = "#{API_HOST}/#{end_point}"
      request = Typhoeus::Request.new(
        end_point,
        method: :post,
        followlocation: true,
        accept_encoding: 'gzip'
      )
      request.on_complete do |response|
        if response.success?
          return JSON.parse(response.response_body)
        else
          return false
        end
      end
      request.run
    end
  end
end
