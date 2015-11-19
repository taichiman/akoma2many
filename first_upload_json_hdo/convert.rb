
def convert(files)
  files.each do |file|
    source = REXML::Document.new(open(file))
    unless source.root.nil?
      parser = Parser.new(source, {file_name: file})
      result = parser.parse
      puts "LOG: parced #{file}"

      save_file(file, result)

    else
      puts "LOG[error] #{file} isn't xml format."
    end

    puts

  end

end
