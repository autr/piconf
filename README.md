# Raspberry Pi Configuration

Backup of Raspberry Pi Buster config files and environment.

# Usage

* `config.js` is a definition of what files and folder to backup.
* `backup.js` will copy these files into the root of the repository.
* `restore.js` will copy backed up files back into the filesystem.

*Use with care!*

# Details

```
Linux dev 5.10.11-v7l+ #1399 SMP Thu Jan 28 12:09:48 GMT 2021 armv7l GNU/Linux

Distributor ID:	Raspbian
Description:	Raspbian GNU/Linux 10 (buster)
Release:	10
Codename:	buster

Last updated: Sun Mar 07 2021
```


<table>
	<thead>
		<tr><td>path</td><td>desc</td></tr>
	</thead>
	<tr><td><code>/etc/samba/smb.conf</code></td><td>create shares for home and various boot config folders (dangerous!)</td>/<tr>
		<tr><td><code>/usr/share/X11/xorg.conf.d/99-fbdev.conf</code></td><td>span desktop across PAL TV out and Waveshare LCD</td>/<tr>
		<tr><td><code>/usr/share/X11/xorg.conf.d/45-evdev.conf</code></td><td>defaults for keyboard, mouse and touchscreens (using evdev, instead of libinput)</td>/<tr>
		<tr><td><code>/usr/share/X11/xorg.conf.d/99-calibration.conf</code></td><td>create transform matrix and adjustments for touchscreen</td>/<tr>
		<tr><td><code>/boot/config.txt</code></td><td>enable LCD driver and video inputs etc</td>/<tr>
		<tr><td><code>/boot/cmdline.txt</code></td><td>additional flag added for framebuffer</td>/<tr>
		<tr><td><code>/etc/lightdm/lightdm.conf</code></td><td>disable sleep in X11 desktop settings</td>/<tr>
		
</table>
	
