if RUBY_VERSION >= '2.7.0'
  require 'bigdecimal'
  BigDecimal.class_eval do
    def self.new(*args)
      self.(''.respond_to?(:force_encoding) ? args[0].to_s.force_encoding(Encoding::ASCII_8BIT) : args[0].to_s, args[1] || 0)
    end
  end
end