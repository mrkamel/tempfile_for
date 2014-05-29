
require "tempfile_for/version"
require "tempfile_for/tempfile"
require "tempfile"

class Tempfile
  def self.for(io_or_data, options = {})
    blank options.merge(:encoding => options[:encoding] || io_or_data.encoding) do |tempfile|
      tempfile.write_ext io_or_data
      tempfile.flush

      yield tempfile if block_given?
    end
  end 

  def self.blank(options = {})
    tempfile = TempfileFor::Tempfile.build(options)

    yield tempfile if block_given?

    tempfile.flush

    options[:read] != false ? File.read(tempfile.path, :encoding => options[:encoding]) : tempfile.copy(options)
  ensure
    tempfile.close!
  end
end

