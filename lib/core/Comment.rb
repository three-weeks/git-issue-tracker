module Comment
  extend self

  def initialize
    puts "initialized Comment"
  end

  def all
    Dir.glob("*[-]*.yml")
  end

  def forIssue(issueId)
    Dir.glob("#{issueId}[-]*.yml")
  end
end
