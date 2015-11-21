Fancy bash prompt
=================

An `/etc/profile.d` file creating a fancy bash prompt.

Install
-------

`sudo cp fancy_prompt.sh /etc/profile.d`

If you are on Ubuntu, that seems to currently ship with another script in
/etc/profile.d/ that kills any `PROMPT_COMMAND` modifications by simply
overwriting them. In that case, just add `source /etc/profile.d/fancy_prompt.sh`
to your `.bashrc` file.

License
-------

While inspired by [an article](https://wiki.archlinux.org/index.php/Color_Bash_Prompt)
in the ArchLinux wiki that is under the GNU FDL, I believe that this version is
sufficiently different to release it under the MIT license.
