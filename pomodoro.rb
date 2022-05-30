# frozen_string_literal: true

require './timer_base'

# 作業時間クラス
class Pomodoro < TimerBase
  MINUTES = 25
  def initialize(minutes: MINUTES)
    super
  end
end
