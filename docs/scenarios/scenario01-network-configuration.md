# Scenario 1: Network Configuration Issue

## Problem Setup
### Introduce Network Configuration Error
Edit the network interface configuration file (`etc/netplan/01-netcfg.yaml` for Ubuntu using Netplan). Introduce an error like an incorrect subnet mask or gateway. For example, change the gateway to a non-existent IP in the subnet.

### Modify DNS Configuration
Modify the `/etc/resolv.conf` file. Replace the existing nameserver entries with incorrect or unreachable DNS server IPs.

## Expected Impact
The instance might lose its ability to communicate with other machines on the network or the internet, depending on the configuration changes.
DNS resolution issues, leading to failure in accessing websites or services by their domain names.

## Troubleshooting Hints
**Diagnose Network Connectivity**: 
- `ping` - check connectivity to external IPs (like 8.8.8.8) and domain names (like google.com). This can help in identifying if the issue is with the network or DNS.
- `ifconfig` or `ip addr` - inspect the network interface configuration. Look for anomalies in IP addresses, netmask, and other settings.

**Check Route Table**:
- `route -n` or `ip route` - view the routing table. Incorrect gateway settings will be evident here.

**Examine DNS Configuration**:
- Check `/etc/resolv.conf` for nameserver entries.
- Test DNS resolution using tools like `nslookup` or `dig`. These tools can also help in determining if the issue is with specific domains or DNS resolution in general.

**Review System Logs**:
- Check logs in `/var/log/syslog` or `journalctl` for any network-related errors.

**Restoring Configuration**:
- Once identified, the misconfiguration can be corrected by restoring the original network settings and DNS configurations.

## Additional Tips
- Systematic approach: start from verifying physical connectivity, then move up the OSI layers.
- Use of comparison tools (like diff) to compare configuration files with backups or known-good configurations.
- Ceck for recent changes in configurations or system updates that might have caused the issue.
- Highlight the importance of documenting changes and maintaining configuration file backups.
