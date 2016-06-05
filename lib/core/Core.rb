require 'git'
require 'yaml'
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

  module Lib
    extend self

    def open(working_dir = nil)
      Git.open(working_dir)
    end

    def repo_changed?(repo)
      repo_changed = repo.status.changed != {}
    end

    def open_issue_branch(repo)
      @savedBranch = repo.lib.branch_current # keep branch, so we can switch back
      if repo_changed?(repo)
        repo.lib.stash_save('issue_temp')
        repo.lib.checkout('issue')
      else
        repo.lib.checkout('issue')
      end
    end

    def close_issue_branch(repo)
      repo.lib.extend(AdditionalMethods)
      repo.lib.checkout(@savedBranch)
      repo.lib.stash_pop('stash@{0}') unless repo_changed?(repo)
    end

    def all_issues(repo)
      open_issue_branch(repo)

      files = Issue.all
      issues = []
      files.each do |file|
        yml = YAML.parse_file(file)
        issues.push(yml.to_ruby)
      end

      close_issue_branch(repo)
      return issues
    end

    def all_comments(repo)
      open_issue_branch(repo)

      files = Comment.all
      comments = []
      files.each do |file|
        yml = YAML.parse_file(file)
        comments.push(yml.to_ruby)
      end

      close_issue_branch(repo)
      return comments
    end

    def test_display(repo)

      puts
      puts "----------------"
      puts "Issues"
      puts "----------------"

      issues = all_issues(repo)

      issues.each do |issue|
        issue.each do |key, value|
          puts "#{key}: #{value}"
        end
        puts
      end

      puts
      puts "***************"
      puts

      puts "----------------"
      puts "Comments"
      puts "----------------"

      comments = all_comments(repo)

      comments.each do |comment|
        comment.each do |key, value|
          puts "#{key}: #{value}"
        end
        puts
      end

    end
  end
end

