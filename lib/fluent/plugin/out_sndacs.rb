module Fluent
  class SndacsOutput < Fluent::TimeSlicedOutput
    Fluent::Plugin.register_output('sndacs', self)

    def initialize
      super
      require 'tempfile'
      require 'zlib'

      #A quick fix for the encoding problem
      #see https://github.com/fluent/fluentd/issues/76
      encoding = Encoding.default_internal
      Encoding.default_internal = nil
      require 'sndacs'
      Encoding.default_internal = encoding
    end

    config_param :path, :string, :default => ''
    config_param :access_key_id, :string
    config_param :secret_access_key, :string
    config_param :bucket, :string

    def configure(conf)
      super

      @formatter = TimeFormatter.new(nil, @localtime)
    end

    def start
      super
      service = Sndacs::Service.new(:access_key_id => @access_key_id,
                                    :secret_access_key => @secret_access_key)
      @bucket_ = service.buckets.find(@bucket)
    end

    def format(tag, time, record)
      "#{@formatter.format(time)}\t#{tag}\t#{record.to_json}\n"
    end

    def write(chunk)
      i = 1
      while true
        object = @bucket_.objects.build("#{@path}#{chunk.key}_#{i}.gz")
        break unless object.exists?
        i += 1
      end

      file = Tempfile.new("sndacs-")
      Zlib::GzipWriter.open(file) do |writer|
        chunk.write_to(writer)
      end

      object.content = File.read(file)
      object.save
    end
  end
end
