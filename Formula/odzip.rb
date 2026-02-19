class Odzip < Formula
  desc "DEFLATE-class LZ77+Huffman compressor"
  homepage "https://github.com/odpay/odzip"
  version "1.0.2"
  license "MIT"

  on_macos do
    url "https://github.com/odpay/odzip/releases/download/v1.0.2/odz-darwin-universal.tar.gz"
    sha256 "cf08a3f94df997a555dc815feb417c864e47746a304395f436fbbb9f5479be33"
  end

  on_linux do
    url "https://github.com/odpay/odzip/releases/download/v1.0.2/odz-linux-amd64.tar.gz"
    sha256 "d7efaf5a513ced6796b44ecae4e3dc5d4a8b9358d3b9c9cae7901aa3c7dc5287"
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
