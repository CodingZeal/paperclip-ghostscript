# Paperclip::Ghostscript

Add support to Paperclip to generate JPG thumbnail images from
Ghostscript supported files (e.g. Adobe PDF)

## Installation

Add this line to your application's Gemfile:

    gem 'paperclip-ghostscript'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paperclip-ghostscript

## Usage

Paperclip::Ghostscript needs access to the Ghostscript binary ("gs").
To determine the location of the binary, in Linux, run `which gs` from
the command line.  It will return a path, such as `/usr/local/bin/gs`.

Add the processor to your model:

```ruby
  class Agreement < ActiveRecord::Base

    has_attached_file :document, styles: {
      thumb: { geometry: "150x150", format: "jpg" }
    }, processors: [:ghostscript]

  end
```

Which will produce a thumbnail JPG of the first page of the PDF.

## Credits

Authored by Adam Cuppy (@acuppy) of Coding ZEAL (http://codingzeal.com)

![Coding
ZEAL](https://googledrive.com/host/0B3TWa6M1MsWeWmxRZWhscllwTzA/ZEAL-logo-final-150.png)

This is freely distributed under the MIT license.  Use it, modify it,
enjoy :)

## Contributing

1. Fork it ( http://github.com/<my-github-username>/paperclip-ghostscript/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
