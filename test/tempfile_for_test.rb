
require File.expand_path("../test_helper", __FILE__)

class TempfileForTest < Minitest::Test
  def test_tempfile_for
    assert_equal "string1, string2", Tempfile.for("string1") { |tempfile| `echo -n ', string2' >> #{tempfile.path}` }
    assert_equal "string1, string2", Tempfile.for("string1", :read => false) { |tempfile| `echo -n ', string2' >> #{tempfile.path}` }.read
    assert_equal Encoding::ISO_8859_1, Tempfile.for("string1".force_encoding(Encoding::ISO_8859_1)) { |tempfile| `echo -n ', string2' >> #{tempfile.path}` }.encoding
  end

  def test_tempfile_blank
    assert_equal "data", Tempfile.blank { |tempfile| `echo -n data >> #{tempfile.path}` }
    assert_equal "data", Tempfile.blank(:read => false) { |tempfile| `echo -n data >> #{tempfile.path}` }.read
    assert_equal Encoding::ISO_8859_1, Tempfile.blank(:encoding => Encoding::ISO_8859_1) { |tempfile| `echo -n data >> #{tempfile.path}` }.encoding
  end
end

