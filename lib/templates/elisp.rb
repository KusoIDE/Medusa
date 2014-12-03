# config/initializers/redcarpet.rb
module ActionView
  module Template::Handlers
    class ELisp
      class_attribute :default_format
      self.default_format = Mime::TEXT

      def call(template)
        #binding.pry
        renderer = ERB.new
        renderer.call(template)
      end
    end
  end
end
