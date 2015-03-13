class TestDataLoader
  def self.load (filename)
    File.open(File.dirname(__FILE__) + '/' + filename.to_s + '.txt')
  end
end