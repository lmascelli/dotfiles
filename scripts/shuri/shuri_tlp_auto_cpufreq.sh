#!/bin/sh

yay -S tlp auto-cpufreq-git
pip install python-requests

sudo=
if [ "$(id -u)" -ne 0 ]; then
  sudo=sudo
fi

cat <<'EOF' | $sudo tee /etc/tlp.d/00-auto-cpufreq.conf
CPU_DRIVER_OPMODE_ON_AC=
CPU_DRIVER_OPMODE_ON_BAT=

CPU_SCALING_GOVERNOR_ON_AC=
CPU_SCALING_GOVERNOR_ON_BAT=

CPU_SCALING_MIN_FREQ_ON_AC=
CPU_SCALING_MAX_FREQ_ON_AC=
CPU_SCALING_MIN_FREQ_ON_BAT=
CPU_SCALING_MAX_FREQ_ON_BAT=

CPU_ENERGY_PERF_POLICY_ON_AC=
CPU_ENERGY_PERF_POLICY_ON_BAT=
#CPU_ENERGY_PERF_POLICY_ON_AC=default
#CPU_ENERGY_PERF_POLICY_ON_BAT=default

CPU_MIN_PERF_ON_AC=
CPU_MAX_PERF_ON_AC=
CPU_MIN_PERF_ON_BAT=
CPU_MAX_PERF_ON_BAT=

CPU_BOOST_ON_AC=
CPU_BOOST_ON_BAT=

CPU_HWP_DYN_BOOST_ON_AC=
CPU_HWP_DYN_BOOST_ON_BAT=
EOF

$sudo systemctl enable tlp.service
$sudo systemctl enable auto-cpufreq.service

$sudo systemctl restart tlp.service
$sudo systemctl restart auto-cpufreq.service
