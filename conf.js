module.exports = [
	{
		path: '/etc/samba/smb.conf',
		title: 'samba',
		description: `shares for editing X11 settings, boot config (dangerous!) and home folder`
	},
	{
		path: '/usr/share/X11/xorg.conf.d/99-fbdev.conf',
		title: 'X11',
		desc: `configuration to span PAL output desktop with Waveshare 32B LCD`
	},
	{
		path: '/boot/config.txt',
		title: 'boot config',
		desc: `enable LCD driver and IMX477 / picap`
	},
	{
		path: '/boot/cmdline.txt',
		title: 'cmdline boot',
		desc: `additional flag for delaying framebuffer driver`
	},
{
path: '/etc/lightdm/lightdm.conf',
title: 'lightdm',
desc: 'disable sleep'
}
]
