require_relative "../lib/core/Core"
require "test/unit"

class TestLib < Test::Unit::TestCase

	def test_repo
    repo = Core::Lib.open('.')
    assert_equal(Git::Base, repo.class)
	end

  def test_assets
    repo = Core::Lib.open('.')
    Core::Lib.test_display(repo)
  end

end
