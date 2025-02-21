#!/bin/sh
#
# File: run.sh
#
# Usage: run.sh <channel>
#
# Purpose: An example of a plain-text ad-hoc run control script
#          that can be used in conjunction with dump_hits to execute
#          free-form run sequences.
#

SEND_CMD="udaq_terminal -p cobs $1"
#SEND_CMD="udaq_terminal -p cobs --trace -vvv $1"
#SEND_CMD="udaq_terminal -p legacy-cobs  $1"


#SLEEP="sleep 1"
SLEEP="sleep 0"


echo "FRAME_WRITE_DELAY 1000" | ${SEND_CMD}
${SLEEP}
echo "STOP_RUN" | ${SEND_CMD}
${SLEEP}
echo "SET_LIVETIME_ENABLE 0" | ${SEND_CMD}
${SLEEP}
echo "RESET_SCHEDULE" | ${SEND_CMD}
${SLEEP}
echo "ADC_RESET_THRESHOLDS" | ${SEND_CMD}
${SLEEP}
#echo "GET_UID" | ${SEND_CMD}
#${SLEEP}
#echo "GETMON" | ${SEND_CMD}
#${SLEEP}
#echo "AUXDAC 1 2650" | ${SEND_CMD}
echo "AUXDAC 1 2660" | ${SEND_CMD}
${SLEEP}
#echo "DAC 1 1400" | ${SEND_CMD}
echo "DAC 1 1365" | ${SEND_CMD}
#echo "DAC 1 1360" | ${SEND_CMD}
#echo "DAC 1 4095" | ${SEND_CMD}
#echo "DAC 1 3095" | ${SEND_CMD}
#echo "DAC 1 2500" | ${SEND_CMD}
#echo "DAC 1 2095" | ${SEND_CMD}
#echo "DAC 1 200" | ${SEND_CMD}
#echo "DAC 1 1" | ${SEND_CMD}
${SLEEP}
echo "TIMESTAMP_MODE 4" | ${SEND_CMD}
${SLEEP}
echo "DISC_OPM 1" | ${SEND_CMD}
${SLEEP}
echo "ADC_TIMER_DELAY 0 18" | ${SEND_CMD}
${SLEEP}
echo "ADC_TIMER_DELAY 2 18" | ${SEND_CMD}
${SLEEP}
echo "ADC_TIMER_DELAY 4 18" | ${SEND_CMD}
${SLEEP}
echo "ADC_TIMER_DELAY 1 136" | ${SEND_CMD}
${SLEEP}
echo "ADC_TIMER_DELAY 3 136" | ${SEND_CMD}
${SLEEP}
echo "ADC_TIMER_DELAY 5 136" | ${SEND_CMD}
${SLEEP}
echo "ADC_TIMER_DELAY 6 136" | ${SEND_CMD}
${SLEEP}
echo "ADC_TIMER_DELAY 7 136" | ${SEND_CMD}
${SLEEP}
echo "ADC_HIST_ENABLE 0" | ${SEND_CMD}
${SLEEP}
echo "ADC_RECORDING_THRESHOLDS 0 0 0" | ${SEND_CMD}
${SLEEP}
echo "ADC_RECORDING_THRESHOLDS 2 0 0" | ${SEND_CMD}
${SLEEP}
echo "ADC_RECORDING_THRESHOLDS 12 0 0" | ${SEND_CMD}
${SLEEP}
echo "ADC_ENABLE 0 1" | ${SEND_CMD}
${SLEEP}
echo "ADC_ENABLE 2 1" | ${SEND_CMD}
${SLEEP}
echo "ADC_ENABLE 12 1" | ${SEND_CMD}
${SLEEP}
#echo "PRINT_TIME" | ${SEND_CMD}
#${SLEEP}
echo "SET_LIVETIME_ENABLE 1" | ${SEND_CMD}
${SLEEP}
echo "RUN 1 0 0" | ${SEND_CMD}

echo running forever ...

#echo running for 120 seconds...
#sleep 120
#sleep 600
#sleep 1200

#echo "STOP_RUN" | ${SEND_CMD}
#${SLEEP}

#echo "GET_RUN_STATISTICS" | ${SEND_CMD}
#${SLEEP}

#echo "FRAME_WRITE_DELAY 200000" | ${SEND_CMD}
#sleep 1
#echo "DUMP_HITS_HEX 32767" | ${SEND_CMD}
#sleep 2
#echo "FRAME_WRITE_DELAY 1000" | ${SEND_CMD}
#sleep 1
