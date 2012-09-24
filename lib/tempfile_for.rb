
require "tempfile_for/version"
require "tempfile"

class Tempfile
  def self.for(data)
    open("tempfile") do |tempfile|
      tempfile.write data
      tempfile.flush

      yield tempfile

      tempfile.flush
      tempfile.rewind

      return File.read(tempfile.path)
    end 
  end 
end

