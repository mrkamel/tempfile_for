
require File.expand_path("../../test_helper", __FILE__)
require "stringio"

class TempfileFor::TemfileTest < Minitest::Test
  def test_copy
    tempfile = TempfileFor::Tempfile.open("tempfile", :encoding => Encoding::BINARY)
    tempfile.write "test"
    tempfile.flush

    copy = tempfile.copy(:encoding => Encoding::ISO_8859_1).read

    assert_equal "test", copy
    assert_equal Encoding::ISO_8859_1, copy.encoding
  end

  def test_write_ext
    tempfile = TempfileFor::Tempfile.open("tempfile")
    tempfile.write_ext StringIO.new("test")
    tempfile.rewind

    assert_equal "test", tempfile.read

    tempfile = TempfileFor::Tempfile.open("tempfile")
    tempfile.write_ext "test"
    tempfile.rewind

    assert_equal "test", tempfile.read
  end

  def test_build
    assert Dir["/tmp/*.jpg"].empty?

    assert_equal Encoding::ISO_8859_1, TempfileFor::Tempfile.build(:suffix => ".jpg", :encoding => Encoding::ISO_8859_1).external_encoding

    refute Dir["/tmp/*.jpg"].empty?
  end
end

