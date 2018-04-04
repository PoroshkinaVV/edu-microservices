require "pdf_generator/version"
require "prawn"

module PdfGenerator

  module_function

  def generate(payload)
    Prawn::Document.generate("#{Time.now.to_i}.pdf") do
      text "#{payload}"
    end
  end
end
