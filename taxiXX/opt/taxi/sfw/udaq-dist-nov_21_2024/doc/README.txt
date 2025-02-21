
The udaq software is deployed as an application suite:

dist/
 |
 |—config/                  : Example configuration files.  These can be extended to incorporate TAXI-specific settings as needed.
 |      |
 |      |-- hub.cfg         : Holds application settings.
 |      |-- run*.cfg        : Holds run settings. Mainly microdaq configurations indexed by channel number.
 |      |-- chan*.cfg       : run*.cfg files can be decomposed into fragments that are re-usable via an @include
 |                            directive in a top level file.
 |                       
 |
 |—---bin/                  : Application binaries
 |      |
 |      |
 |      |-- field_hub       : Data acquisition application.  A multithreaded daq application that executes a single
 |      |                     data-taking run with settings applied from a chosen config file.
 |      |
 |      |-- on              : Power on udaq channel(s)
 |      |
 |      |-- off             : Power off udaq channel(s)
 |      |
 |      |-- status          : Check the power status of udaq channel(s)
 |      |
 |      |-- reprogram       : Reprogram the udaq flash on a udaq channel(s)
 |      |
 |      |-- start           : Start the application on a udaq channel(s)
 |      |
 |      |-- annotate        : produces a human-readable annotation of a hit data file
 |      |
 |      |-- udaq_terminal   : A command terminal to a microdaq, provides ad-hoc interactions
 |      |
 |      |-- dump_hits       : a stand-alone hit buffer readout application
 |
 |
 |----firmware/             : repository of udaq firmwares
 |
 |----platform/             : repository of supporting platform binaries
 |           |
 |           |-- udaqdrv.ko : TAXI kernel module providing udaq driver facilities 
 |       
 |
 |----misc/                 : miscellaneous artifacts
 |       |-- run.sh         : An example of a plain-text ad-hoc run control script
 |                            that can be used in conjunction with dump_hits to execute
 |                            free-form run sequences.
 |
 |----doc/                  : documentation


A distribution should be installed by linking to /opt/taxi/udaq/ and run from there,
E.G.:

> ln -s ~/opt/taxi/sfw/udaq-dist-1.2.3 /opt/taxi/udaq

Configuration files should be maintained in ~/udaq-config


Data taking runs are written to a common sppol directory (as specified in run.cfg)
with an incrementing run number unique within the spool directory.

/home/root/data/udaq/runs
 |
 |run_0000001/                             : A data-taking run
 |      |
 |      |-- run_0000001_chan-1-info.txt    : channel specific config, run start/stop, monitoring data, run stats
 |      |-- run_0000001_chan-1.bin         : channel-specific hit readout 
 |      |-- run_0000001_chan-2-info.txt
 |      |-- run_0000001_chan-2.bin
 |      |-- run_0000001_chan-3-info.txt
 |      |-- run_0000001_chan-3.bin
 |      |-- run_0000001_chan-4-info.txt
 |      |-- run_0000001_chan-4.bin
 |      |-- run_0000001_chan-5-info.txt
 |      |-- run_0000001_chan-5.bin
 |      |-- run_0000001_chan-6-info.txt
 |      |-- run_0000001_chan-6.bin
 |      |-- run_0000001_chan-7-info.txt
 |      |-- run_0000001_chan-7.bin
 |      |-- run_0000001_chan-8-info.txt
 |      |-- run_0000001_chan-8.bin
 |
 |
 |
 |run_0000002/ 
 |run_0000003/ 
 | <...>

 In practice the only configuration parameters that require active management are the 
 per-channel voltage and threshold settings in the run.cfg, E.G:

    dac_threshold = 1370;
    dac_voltage=2660;

Examples:

# take a 10 minute run
field_hub -c <myhub.cfg> -r <myrun.cfg> -l 600

# take a 10 minute run, capturing the log file
field_hub -c <myhub.cfg> -r <myrun.cfg> -l 600 --log-level info --log-file run.log

# take a 30 second run, capturing low level comms traces for debugging
field_hub -c <myhub.cfg> -r <myrun.cfg> -l 30 --trace -vvv


