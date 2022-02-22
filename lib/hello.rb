class Hello
  def self.touch
    FileUtils.touch Rails.root.join('tmp/hello_from_ror.txt')
  end
end
