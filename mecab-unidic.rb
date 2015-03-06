require 'formula'

class MecabUnidic < Formula
  homepage 'http://sourceforge.jp/projects/unidic/'
  url 'http://sourceforge.jp/frs/redir.php?m=jaist&f=%2Funidic%2F58338%2Funidic-mecab_kana-accent-2.1.2_src.zip'
  sha1 'a5e592e1007b831297bcac653cac60c5d6f78fd6'

  depends_on 'mecab'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install"
  end


  def caveats; <<-EOS.undent
    If you want to use UniDic, please rewrite "dicdir".
         #{mecab_dicdir}/etc/mecabrc
    EOS
  end

  def mecab_dicdir
    `mecab-config --prefix`.chomp!
  end
end
