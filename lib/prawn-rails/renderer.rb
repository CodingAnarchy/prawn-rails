require "prawn-rails/document"

module PrawnRails
  class Renderer
    def self.call(template)
      %{
        @filename ||= "\#{controller.action_name}.pdf"

        unless controller.response.nil?
          controller.response.headers['Content-Disposition'] = "inline; filename=\\\"\#{@filename}\\\""
        end

        #{template.source.strip}
      }
    end
  end
end
