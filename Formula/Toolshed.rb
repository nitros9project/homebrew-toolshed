class Toolshed < Formula
  desc "Software tools for TRS-80 Color Computer and Dragon micro hobbyists"
  homepage "https://github.com/nitros9project/toolshed"
  url "https://github.com/nitros9project/toolshed/archive/refs/tags/v2.7.0.tar.gz"
  sha256 "5452aac6a9d00c060c5033c9f80e4589719ab84a7eba11fb9c77630c31b1279f"
  license :cannot_represent
  head "https://github.com/nitros9project/toolshed.git", branch: "main"

  depends_on "markdown" => :build

  def install
    # The bundled command tests expect newly copied files to have current times.
    ENV.delete "SOURCE_DATE_EPOCH"
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
