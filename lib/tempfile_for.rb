
require "tempfile_for/version"
require "tempfile"

class Tempfile
  def self.for(data)
    tempfile = open("tempfile")

    begin
      tempfile.write data
      tempfile.flush

      yield tempfile

      tempfile.flush

      File.read(tempfile.path)
    ensure
      tempfile.close!
    end
  end
end

