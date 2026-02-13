class Odzip < Formula
  desc "DEFLATE-class LZ77+Huffman compressor"
  homepage "https://github.com/odpay/odzip"
  version "1.0.1"
  license "MIT"

  on_macos do
    url "https://github.com/odpay/odzip/releases/download/v1.0.1/odz-darwin-universal.tar.gz"
    sha256 "79b91251dbd0c33fb938dc53644a0874cf96f7b478127a9664013563c9fd598b"
  end

  on_linux do
    url "https://github.com/odpay/odzip/releases/download/v1.0.1/odz-linux-amd64.tar.gz"
    sha256 "b644ba2fb6346f3ac2e0147a0336091aea2c1e94667c532848020557c6079105"
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
