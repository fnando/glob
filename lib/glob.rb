# frozen_string_literal: true

require "glob/map"
require "glob/query"
require "glob/result"
require "glob/version"

module Glob
  def self.new(target)
    Query.new(target)
  end

  def self.query(target, query)
    Query.new(target).query(query)
  end
end
