class Toolshed < Formula
  desc "Software tools for TRS-80 Color Computer and Dragon micro hobbyists"
  homepage "https://github.com/nitros9project/toolshed"
  url "https://github.com/nitros9project/toolshed/releases/download/v2.6.0/toolshed-unix64-2.6.0.tgz"
  sha256 "b7a6f84ac469e029ddbb4a2790e5d5edb20b35424ad385d9849eb748e99497f6"
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
    assert_match "Commands", shell_output("#{bin}/os9", 0)
  end
end
