# Work

Anti-procrastination through `hosts` file hackery.


## Installation

    $ gem install work


## Usage ##

    $ work setup      # => sets up default domain list in ~/.work
    $ work [start]    # => disables access to domain list
    $ work stop       # => enables access to domain list

There is also a `play` alias place which inverses the `work` commands:

    $ play [start]    # => enables access to domain list
    $ play stop       # => disables access to domain list

You can modify your list of work-only domains in `~/.work`.  Just
use the root domain (`www.` will be added automatically.)


## Credits

Ideas and motivation prompted by:

* [get-shit-done](http://github.com/leftnode/get-shit-done)
* Alex Payne: [My Get-Back-To-Work Hack](http://al3x.net/2009/09/14/my-get-back-to-work-hack.html)


## Licensing and Attribution

Copyright (c)2011 [Tim Blair](http://tim.bla.ir/).

Work has been released under the MIT license as detailed in the
LICENSE file that should be distributed with this library; the source code is
[freely available](http://github.com/timblair/work).
