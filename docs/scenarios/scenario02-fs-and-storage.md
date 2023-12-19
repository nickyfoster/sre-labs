# Scenario 2: Filesystem and Storage Issue

## Problem Setup
### Fill Up a Critical Partition
Choose a critical partition, such as `/var` or `/`. Use a command like `fallocate` or `dd` to create a large file. Example: `fallocate -l 10G /var/largefile` to create a 10GB file in `/var`.

### Change Permissions on Critical Directories
Alter permissions on important directories. Example, `chmod 600 /etc` will make the `/etc` directory inaccessible to other users and services.

## Expected Impact
Filling up a critical partition can lead to system instability, failure of applications to write data, and potentially render the system unbootable.
Incorrect permissions on essential directories can cause services to fail, inability to read configuration files, and other permission-related errors.

## Troubleshooting Hints
**Identify Disk Space Usage**:
- Use `df -h` to view disk space usage and identify full partitions.
- Find large files using `du -hsx / | sort -rh | head -10` (adjust the path if necessary).

**Examine and Correct Permissions**:
- Check permissions of directories with `ls -ld /etc` (replace /etc with the relevant directory).
- Correct permissions using `chmod`. For example, `chmod 755 /etc` to restore default permissions.

**Check for System and Application Logs:**
- Inspect logs in `/var/log/` for errors related to disk space or permission issues.
- Application-specific logs might also reveal issues related to storage or access.

**Restore System Stability**:
- If a large file was created, delete it or move it to a partition with adequate space.
- Ensure system-critical directories have the correct permissions for proper operation.

## Additional Tips
- Stress the importance of regular monitoring of disk space and setting up alerts for low disk space situations.
- Encourage them to understand the implications of permission changes, especially on critical system directories.
- Teach them to use commands like find to locate files based on size, permissions, or modification times.
- Remind them of best practices in disk usage, like cleaning up unused files, logs rotation, and using quotas if necessary.