module Comment
  extend self

  # TODO: Check that there aren't already replies to a comment before deleting
  def delete(id)
    File.delete("#{id}.yml") if isComment(id)
  end

  def isComment(id)
    !!(/[-]/ =~ id)
  end

  def all
    Dir.glob("*[-]*.yml")
  end

  def issue(id)
    Dir.glob("#{id}[-]*.yml")
  end

end
