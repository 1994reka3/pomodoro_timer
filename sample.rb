class Parent
  def test
    p 1
  end
end

class Child < Parent
  def test
    super
    p 2
  end
end

Child.new.test