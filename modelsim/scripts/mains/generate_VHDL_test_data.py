# -*- coding: utf-8 -*-
"""
Created on Mon Dec 26 20:11:38 2022

Engineer: Michele Pio Fragasso


Description:
    --File description
"""


import sys
sys.path.insert(0, "../functions/")

import TestData as genData

sys.path.insert(0, "../functions")

dataWidth = 32
IntSize = 6
dataset_index = 1160

tr_d, va_d, te_data = genData.load_data()
#genData.gensetofTestData(dataWidth, IntSize,1,te_data)
genData.genTestData(dataWidth=dataWidth, IntSize=IntSize,testDataNum=dataset_index,te_d = te_data)
