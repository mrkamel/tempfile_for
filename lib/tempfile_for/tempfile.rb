
require "tempfile"

module TempfileFor
  class Tempfile < ::Tempfile
    def copy(options = {})
      encoding = options[:encoding]

      tempfile = self.class.open("tempfile", :encoding => encoding)

      File.open(path, :encoding => encoding) { |stream| tempfile.write_ext stream }

      tempfile.rewind
      tempfile
    end

    def write_ext(io_or_data)
      if io_or_data.respond_to?(:read)
        while data = io_or_data.read(1024)
          write data
        end
      else
        write io_or_data
      end
    end
  end
end

