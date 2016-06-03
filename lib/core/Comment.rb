module Comment
  extend self

  def all
    Dir.glob("*[-]*.yml")
  end

  def issue(id)
    Dir.glob("#{id}[-]*.yml")
  end

end
