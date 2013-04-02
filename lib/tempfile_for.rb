
require "tempfile_for/version"
require "tempfile"

class Tempfile
  def self.for(data)
    tempfile = nil

    if RUBY_VERSION < "1.9"
      tempfile = open("tempfile")
    else
      tempfile = open("tempfile", :encoding => data.encoding)
    end

    begin
      tempfile.write data
      tempfile.flush

      yield tempfile

      tempfile.flush

      if RUBY_VERSION < "1.9"
        File.read tempfile.path
      else
        File.read tempfile.path, :encoding => data.encoding
      end
    ensure
      tempfile.close!
    end
  end
end

