require 'rugged'

module Git

  extend self

  def create
    repo = Rugged::Repository.discover(Dir.pwd)
  end

  def assets
    repo = Git.create
    branch = repo.branches["origin/issue"]
    branch.name
  end
end

include Git

puts Git.assets

