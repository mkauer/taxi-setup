#!/usr/bin/env python

import os
import json

# generate scint panel configs and run configs
# 2025-03-04

UIDS      = './uids_taxi.json'
CONFIGS   = '../taxiXX/home/root/udaq-config'
SPOOL     = './spool.cfg'
TEMP_CTRL = './ext_temp_ctrl.cfg'

THRESHOLD = 800


def main():
    for name in ['saps-taxi', 'sa21-taxi', 'sa25-taxi']:
        genConfigs(name)
        genRunConf(name)
        
    return


def genConfigs(station=None):
    with open(UIDS) as jfile:
        p = json.load(jfile)

    for uid in p:
        if 'station' not in p[uid]: continue
        if p[uid]['station'] != station: continue
        cfg_dir = os.path.join(CONFIGS, 'panels', station)
        if not os.path.exists(cfg_dir): os.makedirs(cfg_dir)
        cfg_file = os.path.join(cfg_dir, '{0}.cfg'.format(uid))

        # make panel configs with HV and thresh correction parameters
        with open(cfg_file, 'w') as of:
            of.write('// Scint panel config \n')
            of.write('// serial: {0} \n'.format(p[uid]['name']))
            of.write('// uid: {0} \n'.format(uid))
            of.write('// station: {0} \n'.format(station))
            of.write('// channel: {0} \n'.format(p[uid]['channel']))
            of.write('\n')
            of.write('uid = \"{0}\";\n'.format(uid))
            of.write('\n')
            of.write('dac_voltage = 0;\n')
            of.write('dac_threshold = 4094;\n')
            of.write('\n')
            of.write('hv_ctrl = { \n')
            of.write('    hv_ctrl_enabled = true;\n')
            of.write('    mip_setpoint = 1000;\n')
            of.write('    mip_pars_0 = {0};\n'.format(p[uid]['mip_pars'][0]))
            of.write('    mip_pars_1 = {0};\n'.format(p[uid]['mip_pars'][1]))
            of.write('    mip_pars_2 = {0};\n'.format(p[uid]['mip_pars'][2]))
            of.write('    mip_pars_3 = {0};\n'.format(p[uid]['mip_pars'][3]))
            of.write('    mip_pars_4 = {0};\n'.format(p[uid]['mip_pars'][4]))
            of.write('    mip_pars_5 = {0};\n'.format(p[uid]['mip_pars'][5]))
            of.write('    period_sec = 60;\n')
            of.write('}\n')
            of.write('\n')
            of.write('thresh_ctrl = { \n')
            of.write('    thresh_ctrl_enabled = true;\n')
            of.write('    set_bins = {0};\n'.format(THRESHOLD))
            of.write('    thresh_pars_0 = {0};\n'.format(p[uid]['thresh_pars_new'][0]))
            of.write('    thresh_pars_1 = {0};\n'.format(p[uid]['thresh_pars_new'][1]))
            of.write('    thresh_pars_2 = {0};\n'.format(p[uid]['thresh_pars_new'][2]))
            of.write('    period_sec = 60;\n')
            of.write('}\n')
            of.close()

        print('wrote --> {0}'.format(cfg_file))
    return


def genRunConf(station=None):
    with open(UIDS) as jfile:
        p = json.load(jfile)

    chan_map = {}
    for uid in p:
        if 'station' not in p[uid]: continue
        if p[uid]['station'] != station: continue
        cfg_dir = os.path.join('./panels', station)
        cfg_file = os.path.join(cfg_dir, '{0}.cfg'.format(uid))
        chan_map[str(p[uid]['channel'])] = cfg_file

    run_file = os.path.join(CONFIGS, '{0}.cfg'.format(station))
    with open(run_file, 'w') as of:
        of.write('// Dec_26_2024 udaq firmware version\n')
        of.write('// run config with temperature corrections\n')
        of.write('\n')
        of.write('name = \"{0}\";\n'.format(station))
        of.write('\n')
        of.write('run_config = {\n')
        of.write('\n')
        of.write('   @include \"{0}\"\n'.format(SPOOL))
        of.write('\n')
        of.write('   udaq_channels = (\n')
        of.write('      {\n')
        of.write('         channel_num = 1;\n')
        of.write('         @include \"{0}\";\n'.format(TEMP_CTRL))
        of.write('         @include \"{0}\"\n'.format(chan_map['1']))
        of.write('      }, {\n')
        of.write('         channel_num = 2;\n')
        of.write('         @include \"{0}\";\n'.format(TEMP_CTRL))
        of.write('         @include \"{0}\"\n'.format(chan_map['2']))
        of.write('      }, {\n')
        of.write('         channel_num = 3;\n')
        of.write('         @include \"{0}\";\n'.format(TEMP_CTRL))
        of.write('         @include \"{0}\"\n'.format(chan_map['3']))
        of.write('      }, {\n')
        of.write('         channel_num = 4;\n')
        of.write('         @include \"{0}\";\n'.format(TEMP_CTRL))
        of.write('         @include \"{0}\"\n'.format(chan_map['4']))
        of.write('      }, {\n')
        of.write('         channel_num = 5;\n')
        of.write('         @include \"{0}\";\n'.format(TEMP_CTRL))
        of.write('         @include \"{0}\"\n'.format(chan_map['5']))
        of.write('      }, {\n')
        of.write('         channel_num = 6;\n')
        of.write('         @include \"{0}\";\n'.format(TEMP_CTRL))
        of.write('         @include \"{0}\"\n'.format(chan_map['6']))
        of.write('      }, {\n')
        of.write('         channel_num = 7;\n')
        of.write('         @include \"{0}\";\n'.format(TEMP_CTRL))
        of.write('         @include \"{0}\"\n'.format(chan_map['7']))
        of.write('      }, {\n')
        of.write('         channel_num = 8;\n')
        of.write('         @include \"{0}\";\n'.format(TEMP_CTRL))
        of.write('         @include \"{0}\"\n'.format(chan_map['8']))
        of.write('      }\n')
        of.write('   );\n')
        of.write('};\n')
        of.close()

    print('wrote --> {0}'.format(run_file))
    return


if __name__ == "__main__":
    main()

