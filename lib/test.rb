require './lib/interface.rb'
require './lib/io_handler.rb'

interface = Interface.new(IOHandler)
interface.run