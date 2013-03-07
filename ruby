        ========================================
            Ruby
        ========================================

$ ruby -ropenssl -rzlib -rreadline -e "puts :success"

$ ruby -r rbconfig -e 'puts RbConfig::CONFIG["configure_args"]'

$ ruby -rrbconfig -e "puts RbConfig::CONFIG['sitearchdir']"

$ ruby -rerb -e "puts ERB.new(File.read('/tmp/foobar.erb')).result"
