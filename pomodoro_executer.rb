require './pomodoro'
require './short_break'
require './long_break'

class PomodoroExecuter
  def run
    loop do
      4.times do
        Pomodoro.new.run
        ShortBreak.new.run
      end
      LongBreak.new.run
    end
  end
end
