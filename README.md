# ShellER - Extra Routines for POSIX Environments

ShellER is a library of functions for the Bourne shell.  It began as a
collection of functions pasted into the author's scripts, continued
life as a single, large file and has been split into modules to reduce
start-up time.


## Prerequisites

Your system must have a POSIX-compliant shell and command-line
utilities.

ShellER expects a fairly standard Unix filesystem layout with binaries
going in `/usr/bin` and ShellER-specific libraries going in
`/usr/libexec/sheller`.  The prefix can be changed during
installation.

The `network` module has one function, `tcp_port_answers`, which
requires [Netcat](http://nc110.sourceforge.net) to operate.  This
function will fail gracefully on systems where it is not installed.


## Build and Installation

Build and install ShellER by running 'make install' as root in the
same directory as this file.

If you want to install ShellER somewhere other than /usr change the
Makefile's PREFIX variable to something else and make sure PREFIX/bin
is in your program search path (e.g., `make PREFIX=/usr/local install`).

Running `make uninstall` will remove ShellER cleanly.  (PREFIX works
here as well.)



## Using ShellER in Your Scripts

To incorporate ShellER into a script, add the following to the
beginning:

````
. $(sheller-init)
````

ShellER groups its available functions into modules which can be
brought into a script by including them:

```
include MODULE [ MODULE ... ]
```

All modules are protected from multiple inclusion.


## Function Documentation

Documentation for functions is currently in comments in the modules
but will eventually be converted into manual pages.


## License

Copyright 2015 Mark Feit <mfeit@notonthe.net>.

This software is licensed under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance with the
License.  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
implied.  See the License for the specific language governing
permissions and limitations under the License.
