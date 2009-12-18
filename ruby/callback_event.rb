require 'rubygems'
require 'active_support'

class AnyClass
  include ActiveSupport::Callbacks
  define_callbacks :before_save, :after_save
end

class Storage < Class
  before_save :pass
  before_save :pass
  before_save :stop
  before_save :pass

  def pass
    puts "pass"
  end

  def stop
    puts "stop"
    return false
  end

  def save
    result = run_callbacks(:before_save) { |result, object| result == false }
    puts "save" if result
  end
end

config = ConfigStorage.new
config.save
