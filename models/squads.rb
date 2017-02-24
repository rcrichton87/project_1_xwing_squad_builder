require_relative('../db/sql_runner.rb')

class Squad

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

end