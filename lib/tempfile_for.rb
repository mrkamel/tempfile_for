
require "tempfile_for/version"
require "tempfile"

class Tempfile
  def self.for(data, options = {})
    blank :encoding => data.encoding, :read => options[:read] do |tempfile|
      tempfile.write data
      tempfile.flush

      yield tempfile
    end
  end

  def self.blank(options = {})
    tempfile = open("tempfile", :encoding => options[:encoding])

    yield tempfile

    tempfile.flush
    tempfile.rewind

    options[:read] != false ? tempfile.read : tempfile
  ensure
    tempfile.close! if options[:read] != false
  end
end

