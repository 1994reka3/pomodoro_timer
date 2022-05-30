# frozen_string_literal: true

# 親クラス（継承確認用）
class Parent
  def test
    p 1
  end
end

# 子クラス（継承確認用）
class Child < Parent
  def test
    super
    p 2
  end
end

Child.new.test
