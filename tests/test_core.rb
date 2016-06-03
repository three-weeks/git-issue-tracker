require_relative "../lib/core/Core"
require "test/unit"

class TestRepo < Test::Unit::TestCase

	def test_repo
    repo = Core::Repo.open('.')
    assert_equal(Git::Base, repo.class)
	end

  def test_assets
    Core::Repo.assets('.')
  end

end
