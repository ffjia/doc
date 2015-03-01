        ========================================
            Ruby
        ========================================

$ ruby -ropenssl -rzlib -rreadline -e "puts :success"

$ ruby -r rbconfig -e 'puts RbConfig::CONFIG["configure_args"]'

$ ruby -rrbconfig -e "puts RbConfig::CONFIG['sitearchdir']"

$ ruby -rerb -e "puts ERB.new(File.read('/tmp/foobar.erb')).result"

1.9.3-p327-falcon :001 > $LOAD_PATH.push('/path/to/lib')

$ rvm 2.0.0 do gem install rspec


Related Links
=============

http://blog.bigbinary.com/2011/07/20/ruby-pack-unpack.html

# vim:set nofoldenable:
