class Issue

  attr_accessor :id, :title
  attr_accessor :created_by, :created, :last_updated, :status
  attr_accessor :comments  # Contains

  def initialize()

    @id = nil
    @title = ''
    @created_by = ''
    @created = ''
    @last_updated = ''
    @status = 'open' # default
    @comments = []

  end

end
