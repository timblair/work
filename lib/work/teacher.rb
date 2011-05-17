require 'digest/md5'
require 'rubygems'
require 'sys/uname'

module Work
  class Teacher

    attr_accessor :path, :domains, :ip

    def initialize(domains, path=nil, ip=nil)
      @domains = domains
      @path = path || "/etc/hosts"
      @ip = ip || "127.0.0.1"
      raise HostsFileNotWritable if !File.writable?(@path)
    end

    def separator
      @separator ||= "#==#{self.class.name}/#{Digest::MD5.hexdigest(self.class.name + path)}"
    end

    def msg
      "# Do not modify.  Controlled by Work: http://github.com/timblair/work"
    end

    def work
      File.open(path, 'r+') do |f|
        lines = f.read
        if !lines.match /#{separator}/
          self.class.overwrite_file(f) do
            extra = domains.collect { |d| "#{ip}\t#{d}\twww.#{d}" }
            lines << "\n\n#{separator}\n#{msg}\n#{extra.join("\n")}\n#{separator}"
          end
        end
      end
    end

    def play
      File.open(path, 'r+') do |f|
        lines = f.read
        if lines.match /#{separator}/
          self.class.overwrite_file(f) do
            lines.gsub /([\s\n]*#{separator}.*#{separator})/m, ""
          end
        end
      end
    end

    def recache!
      case Sys::Uname.sysname.downcase
      when 'darwin'
        system 'dscacheutil -flushcache'
      when 'linux'
        system '/etc/init.d/networking restart'
      else
        puts "Warning: unknown system type #{Sys::Uname.sysname.downcase}."
        puts "You'll need to flush your DNS cache yourself..."
      end
    end

    private

    def self.overwrite_file(file, &block)
      text = yield
      file.rewind
      file.write text
      file.truncate text.length
    end

  end # Class Teacher
end # Module Work
