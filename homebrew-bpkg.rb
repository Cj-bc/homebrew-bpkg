class Bpkg < Formula
  homepage "http://www.bpkg.sh"
  url "https://gihub.com/bpkg/bpkg/archive/0.3.0.tar.gz"
  sha256 "ee86749e0d322fba426e06fabfc53d50172f064240c19cdbdfa4a02475a6a247"

  def install do

    cmd = [ "json", "install", "package", "term", "suggest", "init", "utils", "update", "list", "show", "getdeps" ]
    bin.install "bpkg"
    for CMD in cmd do
      bin.install "bpkg-#{CMD}"
    end

  end

  test do

    system "bpkg", "list"
    testpack =
[ "Cj-bc/bpkg-test", "Cj-bc/bpkg-test.version" ]
    for pkg in testpack do
      system "bpkg", "install", "#{pkg}"
      system "package", "getdeps"
      system "bpkg", "package"
      system "bpkg", "package", "name"
      system "bpkg", "package", "version"
    end

  end
end