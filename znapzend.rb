class Znapzend < Formula
  desc "high performance open source ZFS backup"
  homepage "http://www.znapzend.org/"
  url "https://github.com/oetiker/znapzend/releases/download/v0.14.1/znapzend-0.14.1.tar.gz"
  sha256 "f39097200dc289fbf66d048eccce5579a19103b8af88252f44f55c571ed12589"

  head do
    url "https://github.com/oetiker/znapzend.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  depends_on "wget"

  def install
    system "./bootstrap.sh" if build.head?
    system "./configure", "--disable-silent-rules", "--prefix=#{prefix}"
    system "make", "install"
    #Can be removed when version > 0.14.1
    lib.install "lib/ZnapZend.pm" unless build.head?
  end
end
