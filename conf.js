module.exports = [
	{
		path: '/etc/samba/smb.conf',
		desc: `create shares for home and various boot config folders (dangerous!)`
	},
	{
		path: '/usr/share/X11/xorg.conf.d/99-fbdev.conf',
		desc: `span desktop across PAL TV out and Waveshare LCD`
	},
	{
		path: '/usr/share/X11/xorg.conf.d/45-evdev.conf',
		desc: `defaults for keyboard, mouse and touchscreens (using evdev, instead of libinput)`
	},
	{
		path: '/usr/share/X11/xorg.conf.d/99-calibration.conf',
		desc: `create transform matrix and adjustments for touchscreen`
	},
	{
		path: '/boot/config.txt',
		desc: `enable LCD driver and video inputs etc`
	},
	{
		path: '/boot/cmdline.txt',
		desc: `additional flag added for framebuffer`
	},
	{
		path: '/etc/lightdm/lightdm.conf',
		desc: 'disable sleep in X11 desktop settings'
	}
]
