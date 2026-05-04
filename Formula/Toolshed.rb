class Toolshed < Formula
  desc "Software tools for TRS-80 Color Computer and Dragon micro hobbyists"
  homepage "https://github.com/nitros9project/toolshed"
  url "https://codeload.github.com/nitros9project/toolshed/tar.gz/refs/tags/v2.5.1"
  sha256 "d133c5a1b340f5af7412243b1d0b8168215ee908b79861157e756767b6fe9a34"
  license :cannot_represent
  head "https://github.com/nitros9project/toolshed.git", branch: "main"

  def install
    args = ["prefix=#{prefix}"]

    # Build cocofuse only if FUSE is available on the host
    fuse_available = OS.mac? ? which("fuse-t") : which("fusermount")
    args << "NO_COCOFUSE=1" unless fuse_available

    system "make", "-C", "build/unix", *args, "install"
  end

  test do
    assert_match "os9", shell_output("#{bin}/os9", 1)
  end
end
