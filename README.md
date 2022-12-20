# Run app as given username

> **WARNING**

> You are about to save a password in a text format (though encrypted), I **DO NOT** recommend using this little script unless you're an advanced user.

---

There are times when you need to run an application under another username, or even another domain/username, this should provide a more convenient way of doing it than using the CMD `runas` and typing your password each time.

Add a shortcut to your app in the script's folder and rename it to `target.lnk`, then the script should find its way to the app itself.

Currently available:
- USERNAME - *your username including domain if needed*
- PASSWORD - *your encrypted password*
- WD - *can't think of a case where this should be different from `C:\Windows\System32`, but is configurable nevertheless*

*Note:* The `WorkingDirectory` parameter is required when passing credentials to `Start-Process`.