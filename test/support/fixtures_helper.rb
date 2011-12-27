module FixturesHelper
  def xml_from(file)
    File.read("#{File.dirname(__FILE__)}/../fixtures/#{file}")
  end

  def nokogiri_xml_from(file)
    Nokogiri.XML(xml_from(file)).remove_namespaces!
  end
end