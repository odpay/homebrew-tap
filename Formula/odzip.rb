class Odzip < Formula
  desc "DEFLATE-class LZ77+Huffman compressor"
  homepage "https://github.com/odpay/odzip"
  version "1.0.3"
  license "MIT"

  on_macos do
    url "https://github.com/odpay/odzip/releases/download/v1.0.3/odz-darwin-universal.tar.gz"
    sha256 "307e630d6d01e20b5ce9bfe1739490c55fb77c6614b1ce40a8d523a8a7b0cf4a"
  end

  on_linux do
    url "https://github.com/odpay/odzip/releases/download/v1.0.3/odz-linux-amd64.tar.gz"
    sha256 "9c589a6820001016562475a38862e10476f2a1f4373ee97e0f6175fc37e14a6d"
  end

  def install
    bin.install "odz"
    bin.install_symlink "odz" => "odzip"
  end

  test do
    (testpath/"input.txt").write("hello world")
    system bin/"odz", "c", "input.txt", "output.odz"
    system bin/"odz", "d", "output.odz", "roundtrip.txt"
    assert_equal "hello world", (testpath/"roundtrip.txt").read
  end
end
