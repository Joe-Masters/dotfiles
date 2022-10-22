#!/usr/bin/python
"""Get an icon and percentage level of battery."""
from collections import namedtuple
from pathlib import Path
import sys

BatteryStatus = namedtuple(
        "BatteryStatus",
        [
            "state",
            "capacity",
        ]
    )

def get_linux_battery_status() -> BatteryStatus:
    """Read battery status from file and return."""
    filepath = Path("/sys/class/power_supply/BAT1/uevent")
    battery_state = "UNKNOWN"
    capacity = -1
    with filepath.open() as f:
        status = f.readlines()
    for line in status:
        name, _, value = line.partition("=")
        name = name.replace("POWER_SUPPLY_", "").lower()
        if name == "status":
            battery_state = value.lower().strip()
        elif name == "capacity":
            capacity = int(value)
    return BatteryStatus(battery_state, capacity)

def get_battery_status() -> BatteryStatus:
    if sys.platform == "linux":
        status = get_linux_battery_status()
    else:
        status = BatteryStatus(0, 100)
    return status

def get_icon(capacity: int) -> str:
    if 66 < capacity <= 100:
        icon = " "
    elif 33 < capacity <= 60:
        icon = " "
    elif 9 < capacity <=33:
        icon = " "
    else:
        icon = " "
    return icon

if __name__ == "__main__":
    status = get_battery_status()
    if status.state == "charging":
        print(f"{status.capacity}%")
    else:
        icon = get_icon(status.capacity)
        print(f"{icon} {status.capacity}%")






















