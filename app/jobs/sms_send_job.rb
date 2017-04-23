require 'net/http'
require 'uri'

class SmsSendJob < ApplicationJob
  queue_as :default

  def perform(params)
    puts 'the SmsSendJob started'

    uri = URI.parse('http://192.168.0.94:4001/sms/send')

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request.body = params.to_json
    response = http.request(request)

    puts response.code
    puts response.body

    puts 'the SmsSendJob finished'
  end
end
