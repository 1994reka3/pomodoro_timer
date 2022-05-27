require './pomodoro'
require './short_break'
require './long_break'

class PomodoroExecuter
  def initialize
    @pomodoro_count = 0
    @short_break_count = 0
    @long_break_count = 0
    @four_pomodoro_cycle_count = 0
  end

  def run
    loop do
      pomodoro_cycle_with_logs   # 作業＋短い休憩を4回繰り返す
      long_break_with_logs   # 長い休憩を1回
      @four_pomodoro_cycle_count += 1
      puts "4ポモドーロセット#{((Pomodoro::MINUTES + Break::SHORT_MINUTES) * 4 + Break::LONG_MINUTES) * @four_pomodoro_cycle_count}分経過"
    end
  end

  private

  def pomodoro_cycle_with_logs
    4.times do |i|    # 作業＋短い休憩の流れを4回繰り返す
      pomodoro_with_logs
      short_break_with_logs
      i += 1
      puts "ポモドーロセット#{(Pomodoro::MINUTES + Break::SHORT_MINUTES) * i}分経過"
    end
  end

  def pomodoro_with_logs   # 25分タイマー
    @pomodoro_count += 1
    puts "ポモドーロ#{@pomodoro_count}回目スタート"
    Pomodoro.new.run
    puts "ポモドーロ#{@pomodoro_count}回目終了(#{Pomodoro::MINUTES * @pomodoro_count}分経過)"
  end

  def short_break_with_logs   # 5分休憩タイマー
    @short_break_count += 1
    puts "ショートブレイク#{@short_break_count}回目スタート"
    ShortBreak.new.run
    puts "ショートブレイク#{@short_break_count}回目終了(#{Break::SHORT_MINUTES * @short_break_count}分経過)"
  end

  def long_break_with_logs   # 15分休憩タイマー
    @long_break_count += 1
    puts "ロングブレイク#{@long_break_count}回目スタート"
    LongBreak.new.run
    puts "ロングブレイク#{@long_break_count}回目終了(#{Break::LONG_MINUTES * @long_break_count}分経過)"
  end

end
