gemenv
======

A tool for managing gem environments.

Introduction
------------

gemenv is a tool to build rubygem environments, in the spirit of
Python's virtualenv.  It creates a directory with a complete GEM\_HOME
to contain all of your project's gems.  It also contains an activation
script to enable this environment, and an executor to run subshells
(or anything else) with the right environment variables set.

Here's an example session:

    $ cd /tmp
    $ gemenv my-new-env
    $ ls my-new-env
    bin/ gem_home
    $ source my-new-env/bin/activate
    $ gem install rake
    Fetching: rake-10.0.3.gem (100%)
    Successfully installed rake-10.0.3
    1 gem installed
    Installing ri documentation for rake-10.0.3...
    Installing RDoc documentation for rake-10.0.3...
    {gemenv:my-new-env}
    $ ls my-new-env/gem_home/gems
    rake-10.0.3
    $ which rake
    /tmp/my-new-env/gem_home/bin/rake
	$ echo $VIRTUAL_ENV
	/tmp/my-new-env


You can see that sourcing the activate script does three things:

1. It sets GEM\_HOME so that gem installations go into the environment,
   not your home or system GEM\_HOME
2. It adds the GEM\_HOME bin/ directory to your $PATH so that
   gem-installed binaries are available.
3. It adds a VIRTUAL\_ENV environment variable that you can strap into
   PS1 if you wish.

This is (almost) all it does.  There is currently no way to deactivate
a gemenv environment activated by bin/activate.  If you want a
deactivatable environment, use bin/exec:

    $ my-new-env/bin/exec /bin/bash

Anything which respects GEM\_HOME should work with gemenv, so you can,
for instance, use bundler to install gems into a gemenv.

The activation script currently overwrites GEM_PATH, so gemenv does
not currently support "global" gems.

--
Alex Young <alex@bytemark.co.uk>
