This very small code only print "OK" to stdout and sleep forever.
The sleeplogin is typically used as shell for SSH users that only need port forwarding without any shell.

For example a embedded system in a remote location can use autossh to permanently try to have a SSH connection
with a SSH server with a remote port forwarding exposed on the SSH server that allow to connect to the embedded
system internal port.
For this application the SSH client on the server don't require any shell and for security reasons, it better
to not allow to have a shell at all for the user configured for this SSH connection.
