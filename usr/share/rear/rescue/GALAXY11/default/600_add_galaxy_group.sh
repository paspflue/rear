#
# CommVault uses a special group which we need to copy to the rescue system
#

# append group info to /etc/group if it is not root (0)
galaxy_group=$(stat -L -c "%g" /opt/commvault/Base64/Galaxy)
if test $galaxy_group -gt 0 ; then
    getent group $galaxy_group >>$ROOTFS_DIR/etc/group
fi
