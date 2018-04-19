class Bpkg < Formula
  homepage "http://www.bpkg.sh"
  url "https://gihub.com/bpkg/bpkg/archive/0.3.0.tar.gz"

  def install do

    cmd = [ "json", "install", "package", "term", "suggest", "init", "utils", "update", "list", "show", "getdeps" ]
    bin.install "bpkg"
    for CMD in cmd do
      bin.install "bpkg-#{CMD}"
    end

  end

  test do

    system "bpkg", "list"

    for pkg in [ "Cj-bc/bpkg-test", "Cj-bc/bpkg-test.version" ] do
      system "bpkg", "install", "#{pkg}"
      system "package", "getdeps"
      system "bpkg", "package"
      system "bpkg", "package", "name"
      system "bpkg", "package", "version"
    end

  end
end