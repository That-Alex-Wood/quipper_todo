class TwitsController < ApplicationController
  def create
    begin
      Twitter.update(params[:twit][:text])
    rescue Exception => e
      raise
      logger.error { "fail teeting #{params[:twit][:text]}" }
    end
    head(:ok)
  end
end