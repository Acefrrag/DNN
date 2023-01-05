# -*- coding: utf-8 -*-
"""
Created on Mon Dec 26 20:11:38 2022

Engineer: Michele Pio Fragasso


Description:
    --File description
"""


import sys

import TestData as genData

sys.path.insert(0, "../functions")

dataWidth = 32
IntSize = 16

tr_d, va_d, te_data = genData.load_data()
genData.gensetofTestData(dataWidth, IntSize,1,te_data)
