class ApplicationJob < ActiveJob::Base
  def jobLogger
    Crono.logger.nil? ? Rails.logger : Crono.logger
  end
end
