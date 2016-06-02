#! /usr/bin/env ruby

require 'yaml'

module ParseYAML

  def grabIssueFiles
    Dir.glob("[0-9]{1,}.yml")
  end

  def parseIssues
   files = grabIssueFiles
   files.each do |f|
     puts YAML.load_file(f)
   end
  end

  def grabCommentFiles
    Dir.glob("*[-]*.yml")
  end

end

