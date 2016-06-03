module Issue
  extend self

  def delete(id)
    File.delete("#{id}.yml") if isIssue(id)
  end

  def isIssue(id)
    !(/[-]/ =~ id)
  end

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
