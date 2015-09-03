class Znapzend < Formula
  desc "high performance open source ZFS backup"
  homepage "http://www.znapzend.org/"

  head do
    url "https://github.com/oetiker/znapzend.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  depends_on "wget"

  def install
    system "./bootstrap.sh"
    system "./configure", "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
    lib.install "lib/ZnapZend.pm"
  end
end
