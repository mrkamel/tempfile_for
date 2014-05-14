
require "tempfile"

module TempfileFor
  class Tempfile < ::Tempfile
    def copy(options = {})
      encoding = options[:encoding]

      tempfile = self.class.open("tempfile", :encoding => encoding)

      File.open path, :encoding => encoding do |stream|
        tempfile.write_ext stream
      end

      tempfile.rewind
      tempfile
    end

    def write_ext(io_or_data)
      if io_or_data.respond_to?(:read)
        write(io_or_data.read(1024)) until io_or_data.eof?
      else
        write io_or_data
      end
    end
  end
end

