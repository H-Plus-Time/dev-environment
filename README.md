# Ubuntu in a chroot on Chrome OS

Since most Chromebooks don't have the required kernel headers (and making a custom chromeos build is a PITA), we don't have access to docker. RKT can run some of the simpler docker containers, but more complex ones usually fail due to a non-emulated service or API.

As such, use **all** the version managers (/◕ヮ◕)/.

# macOS

# Windows *here be dragons*

Several of the gold standards (like RVM, nvm) do not work, **period**, on Windows. Outside of .NET, which the author hopes never to rely on in order to live, its best to just run the Linux on Windows or a lightweight VM (both of which provide a debian derivative).

For stubborn collaborators, there is a minimal set of instructions for anaconda, nvm, and uru (windows rvm equivalent). Note, however, that compiled C++ dependencies require pretty much all of Visual Studio (over 6GB); if there are any of these dependencies in the project in question (a quick search for 'gyp' in npm install logs will tell you this), drop tools immediately and switch to the VM approach.
