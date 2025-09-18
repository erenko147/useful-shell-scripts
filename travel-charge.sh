#!/bin/bash
echo "Setting travel mode - charging to 100%"
echo 30 | sudo tee /sys/class/power_supply/BAT0/charge_control_start_threshold
echo 100 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold
echo "Current thresholds: $(cat /sys/class/power_supply/BAT0/charge_control_start_threshold)-$(cat /sys/class/power_supply/BAT0/charge_control_end_threshold)%"
