class Odzip < Formula
  desc "DEFLATE-class LZ77+Huffman compressor"
  homepage "https://github.com/odpay/odzip"
  version "1.0.0"
  license "MIT"

  on_macos do
    url "https://github.com/odpay/odzip/releases/download/v1.0.0/odz-darwin-universal.tar.gz"
    sha256 "c411fe15da19df02a784f831420ef5868e391c85423633d26dd6e1513a9ee990"
  end

  on_linux do
    url "https://github.com/odpay/odzip/releases/download/v1.0.0/odz-linux-amd64.tar.gz"
    sha256 "6dd93901cea68a6463d740f781789687d4f4236d1d2b1455d8f8d47e2195dba2"
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
