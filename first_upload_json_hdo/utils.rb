require 'logger'

module Utils
  $logger = Logger.new(STDOUT)

  def l what, who="*"
    $logger.debug "#{who} - #{what}" if LOG

  end

end


