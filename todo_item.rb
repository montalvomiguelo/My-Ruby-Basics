class TodoItem
  attr_reader :name

  def initialize(name)
    @name = name
    @complete = false
  end

  # When a method changes the receiver its considered a band method!
  def mark_complete!
    @complete = true
  end

  def complete?
    @complete
  end

  def mark_incomplete!
    @complete = false
  end

  def to_s
    if complete?
      "[C] #{name}"
    else
      "[I] #{name}"
    end
  end

end
