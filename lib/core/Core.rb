require 'git'
require_relative "Issue"

module Core

  module Repo
    extend self

    def open(working_dir = nil)
      repo = Git.open(working_dir)
    end

    def assets(working_dir = '.')
      repo = open(working_dir)
      lib = Git::Lib.new(repo)
      currentBranch = lib.branch_current
      lib.checkout('issue')
      puts Issue.all
      lib.checkout(currentBranch)
    end

  end
end

include Core::Repo

Core::Repo.assets
