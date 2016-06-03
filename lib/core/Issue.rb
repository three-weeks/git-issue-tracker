module Issue
  extend self

  def all
    Dir.glob("[0-9]{1,}.yml")
  end

  def range(start, stop)
    pattern = (start..stop).to_a.join('|')
    Dir.glob("[#{pattern}].yml")
  end

  def issue(id)
    Dir.glob("#{id}.yml")
  end

end
