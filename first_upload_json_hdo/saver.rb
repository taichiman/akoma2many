class Saver
  def initialize path
    @path = path 

  end

  def save_file(file_name, result)
    name = File.basename(File.expand_path(file_name),'.xml') + '.json'
    File.open(name,'w'){ |f| f << JSON.pretty_generate(result) }

    puts "LOG: saved #{name}"

  end
end
