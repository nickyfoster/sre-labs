# Scenario 3: CPU and Memory Stress

## Problem Setup
### CPU Intensive Process
Use a tool like stress or `stress-ng` to simulate high CPU usage. For instance, `stress --cpu 8` will stress 8 CPU cores.
Alternatively, you could write a simple shell script that performs a CPU-intensive task, such as an infinite loop with complex calculations.

### Memory Leak Simulation
Simulate a memory leak with a script that gradually allocates memory and doesn't release it. This can be done in various scripting languages like Python or even a shell script.
Another approach is to use stress with the --vm flag, e.g., `stress --vm 2 --vm-bytes 512M`.

## Expected Impact
The CPU-intensive process will cause high CPU utilization, possibly leading to system sluggishness and impacting other processes.

The simulated memory leak will lead to high memory usage, potentially causing swapping, performance degradation, and in extreme cases, out-of-memory (OOM) conditions.

## Troubleshooting Hints
**Monitor CPU Usage**:
- Use tools like `top`, `htop`, or `glances` to monitor CPU usage and identify processes consuming high CPU.
- Understand the difference between user CPU time, system CPU time, and idle time.

**Observe Memory Utilization**:
- Commands like `free -m`, `vmstat`, and `top` can be used to monitor memory usage.
- Identify processes with high memory usage using `ps aux --sort=-%mem`.

**Determine the Root Cause**:
- Once the resource-hogging process is identified, investigate why it's consuming excessive resources. - This might involve checking the process's logs or source code.

**Mitigation and Resolution**:
- Killing or restarting the offending process can temporarily resolve the issue.
- If the issue is in a service or application, deeper investigation into its configuration or code may be required.

## Additional Tips
- Emphasize the importance of understanding normal baseline performance metrics for the system so anomalies can be identified quickly.
- Teach them about the implications of high CPU/memory usage on overall system performance and other processes.
- Encourage them to use and understand various monitoring tools and their outputs.
- Discuss the concept of OOM Killer in Linux and how it decides which process to kill when the system runs out of memory.