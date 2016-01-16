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

  PERL_RESOURCES = []

  def self.perl_resource(val=nil)
    PERL_RESOURCES << val
  end

  #Required for Socket
  resource "ExtUtils::Constant" do
    url "http://backpan.perl.org/authors/id/N/NW/NWCLARK/ExtUtils-Constant-0.23.tar.gz"
    sha256 "23b77025c8a5d3b93c586d4f0e712bcca3ef934edbee00a78c3fad4285f48eab"
  end
  perl_resource "ExtUtils::Constant"

  #Required for IO::Socket::IP
  resource "Socket" do
    url "http://backpan.perl.org/authors/id/P/PE/PEVANS/Socket-2.021.tar.gz"
    sha256 "1ef59ca106b7ed3b3481266fe8d98ecc94790dd87f35aa09b8a09202eb01a5ec"
  end
  perl_resource "Socket"

  #Required for Mojolicious
  resource "IO::Socket::IP" do
    url "http://backpan.perl.org/authors/id/P/PE/PEVANS/IO-Socket-IP-0.37.tar.gz"
    sha256 "2adc5f0b641d41f662b4d99c0795780c62f9af9119884d053265fc8858ae6f7b"
  end
  perl_resource "IO::Socket::IP"

  #Required for Mojolicious
  resource "Time::Local" do
    url "http://backpan.perl.org/authors/id/D/DR/DROLSKY/Time-Local-1.2300.tar.gz"
    sha256 "b2acca03700a09f8ae737d3084f3f6287e983da9ab7b537c6599c291b669fb49"
  end
  perl_resource "Time::Local"

  #Required for ZnapZend
  resource "Mojolicious" do
    url "http://backpan.perl.org/authors/id/S/SR/SRI/Mojolicious-5.72.tar.gz"
    sha256 "323218db02890a0b5e5d756f663ad32dbf312d05aa564b06d0a927e4a6a434d4"
  end
  perl_resource "Mojolicious"

  #Required for IO::Pipely
  resource "Carp" do
    url "http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Carp-1.38.tar.gz"
    sha256 "a5a9ce3cbb959dfefa8c2dd16552567199b286d39b0e55053ca247c038977101"
  end
  perl_resource "Carp"

  #Required for IO::Pipely
  resource "Exporter" do
    url "http://backpan.perl.org/authors/id/T/TO/TODDR/Exporter-5.72.tar.gz"
    sha256 "cd13b7a0e91e8505a0ce4b25f40fab2c92bb28a99ef0d03da1001d95a32f0291"
  end
  perl_resource "Exporter"

  #Required for Scalar::Util
  resource "Scalar::List::Utils" do
    url "http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Scalar-List-Utils-1.42.tar.gz"
    sha256 "3507f72541f66a2dce850b9b56771e5fccda3d215c52f74946c6e370c0f4a4da"
  end
  perl_resource "Scalar::List::Utils"

  #Required for IO::Pipely
  resource "Scalar::Util" do
    url "http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Scalar-Util-1.42_002.tar.gz"
    sha256 "781e58b028bd9f5633e523a18f9d37cbb8bbb85a741f9617307639b5acbdd9f8"
  end
  perl_resource "Scalar::Util"

  #Required for Test::Simple
  resource "Test2" do
    url "http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/Test2-0.000020.tar.gz"
    sha256 "8945fe7c1eac2e95657fba97d5d6f3cbafeaae506106126381780370e7faf56a"
  end
  perl_resource "Test2"

  #Required for IO::Pipely
  resource "Test::Simple" do
    url "http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/Test-Simple-1.302013_011.tar.gz"
    sha256 "4cb9182ec62d4d0380795f62a5f5f13aec744eb4e0143f3cb352b878eb13afe2"
  end
  perl_resource "Test::Simple"

  #Required for IO::Pipely
  resource "base" do
    url "http://backpan.perl.org/authors/id/R/RJ/RJBS/base-2.23.tar.gz"
    sha256 "40f55841299a9fe6fab03cd098f94e9221fb516978e9ef40fd8ff2cbd6625dde"
  end
  perl_resource "base"

  #Required for Mojo::IOLoop::ForkCall
  resource "IO::Pipely" do
    url "http://backpan.perl.org/authors/id/R/RC/RCAPUTO/IO-Pipely-0.005.tar.gz"
    sha256 "e33b6cf5cb2b46ee308513f51e623987a50a89901e81bf19701dce35179f2e74"
  end
  perl_resource "IO::Pipely"

  #Required for Mojo::IOLoop::ForkCall
  resource "Perl::OSType" do
    url "http://backpan.perl.org/authors/id/D/DA/DAGOLDEN/Perl-OSType-1.009.tar.gz"
    sha256 "245cf4c9f7614ac5e5c3bc82621fa2ab4f3c25e0aaae3016b7eed5d40ddcae06"
  end
  perl_resource "Perl::OSType"

  #Required for ZnapZend
  resource "Mojo::IOLoop::ForkCall" do
    url "http://backpan.perl.org/authors/id/J/JB/JBERGER/Mojo-IOLoop-ForkCall-0.17.tar.gz"
    sha256 "886de5c3b44194a86228471075fac4036073bda19093e776c702aa65c3ef1824"
  end

  def install
    ENV.prepend_create_path "PERL5LIB", buildpath+"thirdparty/lib/perl5"
    PERL_RESOURCES.each do |r|
      resource(r).stage do
        system "perl", "Makefile.PL", "INSTALL_BASE=#{buildpath}/thirdparty"
        system "make"
        system "make", "install"
      end
    end

    #Separated from the others because it doesn't have Makefile.PL
    resource("Mojo::IOLoop::ForkCall").stage do
      system "perl", "Build.PL", "--install_base=#{buildpath}/thirdparty"
      system "./Build"
      system "./Build", "install"
    end

    system "./bootstrap.sh" if build.head?
    system "./configure", "--disable-silent-rules", "--prefix=#{prefix}"
    system "make", "install"

    #Can be removed when version > 0.14.1
    lib.install "lib/ZnapZend.pm" unless build.head?
  end
end
