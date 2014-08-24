require "paperclip"
require "paperclip/ghostscript/version"

module Paperclip
  class Ghostscript < Processor

    COMMAND = "gs"

    attr_accessor :current_geometry, :target_geometry, :format, :whiny, :convert_options, :source_file_options

    def initialize file, options = {}, attachment = nil
      super
      @file           = file
      @format         = options[:format]

      @current_format = File.extname(@file.path)
      @basename       = File.basename(@file.path, @current_format)
    end

    def make
      handle_make { process! }
      destination_file
    end

    private

    #def file
      #@file or raise "File is not defined"
    #end

    def basename
      @basename or raise "Basename is not defined"
    end

    def destination_file
      @destination_file ||= Tempfile.new([basename, destination_format])
    end

    def destination_format
      self.format ? ".#{self.format}" : ''
    end

    def source_path
      File.expand_path(file.path)
    end

    def destination_path
       File.expand_path(destination_file.path)
    end

    def parameters
      @parameters ||= [
        "-dNOPAUSE -dBATCH -sDEVICE=jpeg -r144 -dUseCIEColor -dFirstPage=1 -dLastPage=1",
        "-sOutputFile=:dest",
        ":source"
      ].flatten.compact.join(" ").strip.squeeze(" ")
    end

    def process!
      Paperclip.run(COMMAND, parameters, source: source_path, dest: destination_path)
    end

    def handle_make(&block)
      destination_file.binmode
      block.call
    rescue => e
      raise "There was an error processing the thumbnail for #{@basename}: #{e.message}"
    end
  end
end
