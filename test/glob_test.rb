# frozen_string_literal: true

require "test_helper"

class GlobTest < Minitest::Test
  test "with last component as star" do
    glob = Glob.new(
      user: {name: "USER", email: "EMAIL"},
      repo: {name: "REPO"}
    )

    expected = {user: {name: "USER", email: "EMAIL"}}
    query = glob.query("user.*")

    assert_equal ["user.email", "user.name"], query.paths
    assert_equal expected, query.to_hash
  end

  test "with star as the initial component" do
    glob = Glob.new(
      user: {name: "USER", email: "EMAIL"},
      repo: {name: "REPO"}
    )

    expected = {user: {name: "USER"}, repo: {name: "REPO"}}
    query = glob.query("*.name")

    assert_equal ["repo.name", "user.name"], query.paths
    assert_equal expected, query.to_hash
  end

  test "with star as the middle component" do
    glob = Glob.new(
      config: {
        user: {name: "USER", email: "EMAIL"},
        site: {name: "SITE", host: "HOST"}
      }
    )

    expected = {config: {user: {name: "USER"}, site: {name: "SITE"}}}
    query = glob.query("config.*.name")

    assert_equal ["config.site.name", "config.user.name"], query.paths
    assert_equal expected, query.to_hash
  end

  test "with just a star" do
    expected = {config: {
      user: {name: "USER", email: "EMAIL"},
      site: {name: "SITE", host: "HOST"}
    }}
    glob = Glob.new(expected)
    query = glob.query("*")

    assert_equal [
      "config.site.host",
      "config.site.name",
      "config.user.email",
      "config.user.name"
    ], query.paths
    assert_equal expected, query.to_hash
  end

  test "with mixed stars" do
    glob = Glob.new(
      config: {
        user: {name: "USER", email: "EMAIL"},
        site: {name: "SITE", host: "HOST"}
      }
    )
    query = glob.query("*.site.*")

    expected = {
      config: {
        site: {name: "SITE", host: "HOST"}
      }
    }

    assert_equal [
      "config.site.host",
      "config.site.name"
    ], query.paths
    assert_equal expected, query.to_hash
  end
end
