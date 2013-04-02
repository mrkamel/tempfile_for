# encoding: utf-8

require File.expand_path("../../lib/tempfile_for", __FILE__)
require "test/unit"

class TempfileForTest < Test::Unit::TestCase
  def test_tempfile_for
    assert_equal "string1, string2", Tempfile.for("string1") { |tempfile| `echo -n ', string2' >> #{tempfile.path}` }

    if RUBY_VERSION >= "1.9"
      string = "string1".force_encoding("ISO-8859-1")
      res = Tempfile.for(string) { |tempfile| `echo -n ', string2' >> #{tempfile.path}` }
      assert_equal "ISO-8859-1", res.encoding.name
    end
  end
end

