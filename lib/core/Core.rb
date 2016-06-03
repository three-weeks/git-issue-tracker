require 'git'
require_relative "Issue"
require_relative "Comment"

module Core

  module Repo
    extend self

    def open(working_dir = nil)
      Git.open(working_dir)
    end

    def assets(working_dir = '.')

      repo = open(working_dir)

      currentBranch = repo.lib.branch_current # keep branch, so we can switch back
      repo.lib.checkout('issue')

      puts "Issues"
      puts "----------------"
      puts Issue.all

      puts "Comments"
      puts "----------------"
      puts Comment.all

      repo.lib.checkout(currentBranch)
    end

  end
end

