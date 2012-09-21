
require File.expand_path("../../lib/tempfile_for", __FILE__)
require "test/unit"

class TempfileForTest < Test::Unit::TestCase
  def test_tempfile_for
    assert_equal "string1, string2", Tempfile.for("string1") { |tempfile| `echo -n ', string2' >> #{tempfile.path}` }
  end
end

