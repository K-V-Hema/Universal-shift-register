# Universal-shift-register

The Universal Shift Register (USR) is a parameterized, synchronous digital module that supports four primary operations: parallel load, shift left, shift right, and hold.
It also supports serial input and serial output for shift operations.

*Ports*

clk – Positive edge triggered clock.
rst – Active-low asynchronous reset.
load – Parallel load enable.
hold – Hold current value.
shift_left – Shift left control.
shift_right – Shift right control.
serial_in – Serial input bit (0 or 1).
parallel_in – Parallel data input (WIDTH bits).
serial_out – Serial output.
parallel_out – Parallel output.

*Parameter*

WIDTH parameter = 8bits.

*Operations(testcases) to Verify*

Load – Load parallel_in into register.
Hold – No change in register.
Shift Left – Shift left by 1, MSB gets serial_in.
Shift Right – Shift right by 1, LSB gets serial_in.
No Operation – When none of the control signals are active.

*Constraints*

-shift_left and shift_right cannot be 1 together.
-load and hold cannot be 1 together.
-serial_in must be inside {0,1}.

*Coverpoints*

All operations: load, hold, shift_left, shift_right, no_operation


