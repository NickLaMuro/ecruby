ECRuby
======

This is the static site for the ECRuby group.  If you wish to make changes, for
the repo, make changes, and do a pull request.

Working with Vagrant
--------------------
You can develope and test out your changes to the ECRuby site using vagrant!

### Requirements:

You need a few things to get the vagrant gem working for you:

#### Virtual Box

[https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

#### A version of ruby

If you are working on windows 64bit, you have to use jruby:  
[http://www.vagrantup.com/getting-started/setup/windows_x64.html](http://www.vagrantup.com/getting-started/setup/windows_x64.html])


Otherwise most versions of ruby should work just fine.

#### The Vagrant Gem

```shell
  $ gem install vagrant
```

### Usage

Clone the repo onto your local machine, and `cd` into the directory.  From
there, run vagrant with the following command:

```shell
  $ vagrant up
```

This will boot up the VM and provision it using the chef recipies.  It will
take a bit to start up, so take a break and grab a cup of coffee.

After it has finished, you can access the site in your browser using the
following url:

[htto://localhost:8080](http://localhost:8080)

### SSH access

If you want to access the box itself, just run the following:

```shell
  $ vagrant ssh
```

if you are running this on a mac or linux machine.

If you happen to be on windows, running the command will print out a output
with a path to a .ppk file.  This is a putty private key, and you can use it to
ssh into the box using putty.  Specific direction can be found on the official
vagrant website:

[http://vagrantup.com/docs/getting-started/setup/windows.html#ssh](http://vagrantup.com/docs/getting-started/setup/windows.html#ssh)

