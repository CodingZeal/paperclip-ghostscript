module SupportHelpers
  def support_file_path(path)
    File.expand_path("../support/#{path}", __FILE__)
  end

  def support_file(path, method = "r")
    File.open(support_file_path(path), method)
  end
end
