
def convert(files)
  files.each do |file|
    source = REXML::Document.new(open(file))
    unless source.root.nil?
      result = Parser.new(source, {file_name: file}).parse
      puts "LOG: parced #{file}"

      save_file(file, result)

    else
      puts "LOG[error] #{file} isn't xml format."
    end

    puts

  end

end

def save_file(xml, data)
  new_name = File.basename(File.expand_path(xml),'.xml') + '.json'
  json_path = File.join(OUTPUT_PATH, new_name)

  File.open(json_path, 'w') {
    |f| f << JSON.pretty_generate(data)
  }

  puts "LOG: saved #{new_name}"

end

