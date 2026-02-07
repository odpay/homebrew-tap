class Odz < Formula
  desc "DEFLATE-class LZ77+Huffman compressor"
  homepage "https://github.com/odpay/odzip"
  version "0.0.0"
  license "MIT"

  on_macos do
    url "https://github.com/odpay/odzip/releases/download/v#{version}/odz-darwin-universal.tar.gz"
    sha256 "PLACEHOLDER"
  end

  on_linux do
    url "https://github.com/odpay/odzip/releases/download/v#{version}/odz-linux-amd64.tar.gz"
    sha256 "PLACEHOLDER"
  end

  def install
    bin.install "odz"
  end

  test do
    (testpath/"input.txt").write("hello world")
    system bin/"odz", "c", "input.txt", "output.odz"
    system bin/"odz", "d", "output.odz", "roundtrip.txt"
    assert_equal "hello world", (testpath/"roundtrip.txt").read
  end
end
