class SmsController < ApplicationController
  def show
    sms = {
      'recipient' => '0727686700',
      'message' => 'Hello from Ruby on Rails'
    }

    SmsSendJob.perform_later(sms)
    render :plain => 'Message added to the queue'
  end
end
