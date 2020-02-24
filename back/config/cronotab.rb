# cronotab.rb — Crono configuration file
#
# Here you can specify periodic jobs and schedule.
# You can use ActiveJob's jobs from `app/jobs/`
# You can use any class. The only requirement is that
# class should have a method `perform` without arguments.
#
# class TestJob
#   def perform
#     puts 'Test!'
#   end
# end
#
# Crono.perform(TestJob).every 2.days, at: '15:30'
#

require 'rake'
require 'open-uri'
require 'json'

Rails.application.load_tasks

class Weather
  def perform
    Rake::Task['weather:get'].execute
  end
end

Crono.perform(Weather).every 1.day, at: "1:00"