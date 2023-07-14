# Detection_of_replay-attack_using_dynamic_watermarking
The project described here focuses on developing a distributed watermarking approach to address the
problem of replay assaults in a distributed control microgrid (DCmG). The primary goal aims to
improve the monitoring system used to verify the data sent back and forth within the microgrid between
Distributed Generation Units (DGUs).
In the beginning, a study is done to comprehend how the monitoring system behaves when replay
assaults are used against it without the use of a watermark. As long as the recorded data is inside the
steady state, it is discovered that these attacks are undetectable. Therefore, the necessity for an
additional technique to efficiently detect and stop replay attacks is evident. A watermark is added to
the system to help with this problem.
A requirement that the watermark must meet in order to successfully identify replay attacks is derived.
The system's steady-state characteristic statistics are changed by integrating the watermark, allowing
the monitoring system to differentiate between genuine communication signals and data that has
been replayed.

Working

In a normal operating condition, the four interconnected systems work seamlessly without any errors.
They are designed to function together. However, to demonstrate that a load is connected at t=4 seconds, a change in the load can be observed within the system.At this
stage, the attack mode is not activated, meaning the system is secure and unaffected by any malicious
activities. The system operates in a steady state, and any potential attacks go unnoticed.
However, when the attack mode is enabled to a high level, an attack is initiated at t=3 seconds. Initially, this attack remains undetected while the system is in a steady state.
However, at t=4 seconds, the load shifts, and inaccurate measurements at the consensus controller
led to an unstable system. As a result, the uncontrolled line currents exceed the rated capacity, as
depicted in the bottom row of the plot. Within 300 milliseconds of the load change, the local
Distributed Generation Unit (DGU) is damaged due to the attack. The timing of the attack can be
altered to target the DGUs simultaneously or at different times. Since the watermark mode is not
enabled, the attack remains invisible to the system.
When the watermark mode is enabled, a watermark signal is introduced, converting the delay caused
by the attack into a disturbance. The residual plots  the response to the attack at
t=3 seconds. The voltage difference measured in DGU 1 (top left) and the line currents observed in
both DGUs (bottom row) are non-zero and exceed predetermined thresholds within 4 milliseconds.
The voltage difference in DGU 2 (top right) remains at 0, indicating that the attack was directed at
the signals from DGU 1.
If both DGU 1 and DGU 3 are attacked simultaneously, the presence of a residual output voltage
(Vout) suggests that the signals from both DGU 1 and DGU 2 have been attacked. In the case of
attacks occurring at different times, the Kalman filter is utilized to detect the DGU with the least
attacked time. The filter then mitigates the attack, filtering out the malicious signals and halting the
operation of the affected DGU a
