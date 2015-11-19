require 'getoptlong'

def print_help
  <<-EOF
  Please provide xml file(s) name or glob

  Usage:
    xml2hdojson xml-filename...
  EOF

end

def cli_options
  opts = GetoptLong.new(
    ['--help', '-h', GetoptLong::NO_ARGUMENT],
    ['--output-path', '-p', GetoptLong::REQUIRED_ARGUMENT]
  )

  l 'before parsing'

  begin
    cli_opts = { output_path: nil}
    opts.each do |opt, arg|
      case opt
        when '--help'
          print_help
        when '--output-path' 
          cli_opts[:output_path] = arg
      end
    end
    cli_opts
  rescue GetoptLong::InvalidOption
    print_help
  end

end

def output_path_create opts
  p = opts[:output_path]
  if p.nil? 
    Dir.pwd
  else
    begin
      FileUtils.mkdir_p p
    rescue Errno::EACCES 
      puts "Permission denied: mkdir #{p} ".red
    rescue => e
      raise e
    end
  end

end

