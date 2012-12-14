gemenv
======

A tool for managing gem environments.

Introduction
------------

gemenv is a tool to build rubygem environments, in the spirit of
Python's virtualenv.  It creates a directory with a complete GEM\_HOME
to contain all of your project's gems.  It also contains an activation
script to enable this environment.

Here's an example session:

    $ cd /tmp
    $ gemenv my-new-env
    $ ls my-new-env
    bin/ gem\_home
    $ source my-new-env/bin/activate
    {gemenv:my-new-env}
    $ gem install rake
    Fetching: rake-10.0.3.gem (100%)
    Successfully installed rake-10.0.3
    1 gem installed
    Installing ri documentation for rake-10.0.3...
    Installing RDoc documentation for rake-10.0.3...
    {gemenv:my-new-env}
    $ ls my-new-env/gem\_home/gems
    rake-10.0.3
    {gemenv:my-new-env}
    $ which rake
    /tmp/my-new-env/gem_home/bin/rake

You can see that sourcing the activate script does three things:

1. It adds the environment name to the prompt
2. It sets GEM\_HOME so that gem installations go into the environment,
   not your home or system GEM\_HOME
3. It adds the GEM\_HOME bin/ directory to your $PATH so that
   gem-installed binaries are available.

This is all it does.  There is currently no way to deactivate a gemenv
environment, although this could be added in the future.

Anything which respects GEM\_HOME should work with gemenv, so you can,
for instance, use bundler to install gems into a gemenv.

-- 
Alex Young <alex@bytemark.co.uk>
