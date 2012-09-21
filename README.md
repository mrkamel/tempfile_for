# TempfileFor

Easily create temporary files for in-memory data, modify the file, and get the full content returned.

## Installation

Add this line to your application's Gemfile:

    gem "tempfile_for", :git => "https://github.com/mrkamel/tempfile_for.git"

And then execute:

    $ bundle

## Usage

TempfileFor is a very tiny gem, with only a few lines of code.
However, it can save you lines of ugly code.

To get a quick introduction into what TempfileFor does, check this out:

<pre>
Tempfile.for("string1") { |tempfile| `echo -n ', string2' >> #{tempfile.path}` }
=> "string1, string2"
</pre>

Say, you have some in-memory data, like an image you fetch from an URL - and you want to somehow modify it partially
like e.g., add or remove IPTC tags, or scale it, etc. Often, the gems used to modify images or other media files
require a path to the file to be able to modify it.

This is easy thanks to TempfileFor:

<pre>

data = RestClient.get("http://example.com/image.jpg")

image = Tempfile.for(data) do |tempfile|
  # Modify the tempfile and get the modified content returned.
  # Tempfile takes care about flushing the file's modifications and rewinding, etc.
end
</pre>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
