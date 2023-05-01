# frozen_string_literal: true

require './lib/interface'
require './lib/io_handler'

interface = Interface.new(IOHandler)
interface.run
