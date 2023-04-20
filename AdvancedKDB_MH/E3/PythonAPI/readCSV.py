import pykx as kx
import numpy
from numpy import genfromtxt
import time

def read_csv(filename):
        data = genfromtxt(filename, delimiter=',', dtype=("|S10", float,int))
        return data

conn=kx.QConnection('localhost', 5020)
#print(conn)

for row in read_csv('/home/mhagan_kx_com/E3/trade.csv'): 
    tick = [numpy.string_(row[0]).decode('utf-8'),
            numpy.float_(row[1]),
            numpy.int_(row[2])] 
    print('Publishing row of tick data')
    print(tick)
    conn('.u.upd', 'trade', tick)
    time.sleep(1)
