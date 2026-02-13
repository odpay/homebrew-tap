class Odzip < Formula
  desc "DEFLATE-class LZ77+Huffman compressor"
  homepage "https://github.com/odpay/odzip"
  version "1.0.1"
  license "MIT"

  on_macos do
    url "https://github.com/odpay/odzip/releases/download/v1.0.1/odz-darwin-universal.tar.gz"
    sha256 "ef588c27cef70088f29e9cb8db1a20553731fd50224df26b40251dba01b1b75b"
  end

  on_linux do
    url "https://github.com/odpay/odzip/releases/download/v1.0.1/odz-linux-amd64.tar.gz"
    sha256 "6745aefac786e408093fe8e796231f683d8c5ee0bd4ee1b0eae7ba44403a183f"
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
