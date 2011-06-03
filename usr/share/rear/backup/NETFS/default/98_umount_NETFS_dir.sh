# umount NETFS mountpoint

# don't mount anything for tape backups
if [ "$NETFS_PROTO" == "tape" ]; then
	return
fi

if test "$NETFS_UMOUNTCMD" ; then
	Log "Running '$NETFS_UMOUNTCMD ${BUILD_DIR}/netfs'"
	$NETFS_UMOUNTCMD "${BUILD_DIR}/netfs"
else
	Log "Running 'umount -f ${BUILD_DIR}/netfs'"
	umount -f "${BUILD_DIR}/netfs"
fi
StopIfError "Could not unmount directory ${BUILD_DIR}/netfs"

# the argument to RemoveExitTask has to be identical to the one given to AddExitTask
RemoveExitTask "umount -fv '$BUILD_DIR/netfs' 1>&2"
