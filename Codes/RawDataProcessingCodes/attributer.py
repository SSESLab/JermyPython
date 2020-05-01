# code to give attributes to data
# modified to have sample data

import os
import pandas as pd
import fileinput
import pathlib
import datetime
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.pyplot import figure
import seaborn as sns
import pandas_profiling as pp


# Change directory to where the csv file is

os.chdir(r'<directory_path>')

# Total
a = pd.read_csv('a.csv', sep=',', index_col=0)
b = pd.read_csv('b.csv', sep=',', index_col=0)


# gender
a['Gender'] = '<gender1>'
b['Gender'] = '<gender2>'

# Region
a['Country'] = '<place1>'
b['Country'] = '<place2>'


# LAB
a['Lab'] = '<Lab1>'
b['Lab'] = '<Lab2>'


# Time in this Country
a['Time'] = 'New'
b['Time'] = 'Acc'


All = pd.concat([a,b])
del (All['BGTemp_C_Avg'], All['co2 conc'])
All.to_csv('All.csv')
