# frozen_string_literal: true

require "glob/map"
require "glob/query"
require "glob/matcher"
require "glob/symbolize_keys"
require "glob/version"

module Glob
  def self.filter(target, paths = ["*"])
    glob = new(target)
    paths.each {|path| glob.filter(path) }
    glob.to_h
  end

  def self.new(target)
    Query.new(target)
  end
end
