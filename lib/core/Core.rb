require 'git'
require_relative "Issue"
require_relative "Comment"

module AdditionalMethods
  def stash_pop(id=nil)
    if id
      command('stash pop', [id])
    else
      command('stash pop')
    end
  end
end

module Core

  module Repo
    extend self

    def open(working_dir = nil)
      Git.open(working_dir)
    end

    def assets(working_dir = '.')

      repo = open(working_dir)
      repo.lib.extend(AdditionalMethods)

      currentBranch = repo.lib.branch_current # keep branch, so we can switch back
      if repo.status.changed == {}
        repo.lib.checkout('issue')
      else
        repo.lib.stash_save('issue_temp')
        repo.lib.checkout('issue')
      end

      puts "\n----------------"
      puts "Issues"
      puts "----------------"
      puts Issue.all
      puts

      puts "Comments"
      puts "----------------"
      puts Comment.all

      repo.lib.checkout(currentBranch)
      repo.lib.stash_pop('stash@{0}')
    end

  end
end

