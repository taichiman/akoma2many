class Parser
  def initialize(doc)
    @doc = doc

  end

  def parse
    @data = clean_special
    map

  end

  private

  def map
    data = {}

    data[:presidents] = { name: 'foo bar', external_id: 'baz' }
    log(:presidents)

    data[:session] = @data.elements['akomaNtoso/debate/debateBody/debateSection/heading'].text

    data[:transcript] = ARGV[1] 

    data[:order] = 'foo bar baz order'

    data[:external_id] = 'foo bar baz external_id'

    data[:name] = 'dra-sandra-ovalle-garcia'

    data[:party] = 'foo bar baz party '
    
    data[:time] = 'foo bar baz time'

    e = @data.elements["//speech[@by='#dra-sandra-ovalle-garcia']"]
    t = e.elements[2].texts.join 
    data[:text] = t 

    data[:title] = 'foo bar baz title'

    data

  end

  def clean_special
    #raise
    @doc
  end

  def log(key)
    puts "LOG: data[key] = #{data[key]}" if LOG

  end

end

