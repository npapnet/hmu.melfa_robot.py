
import serial as serial


serial.Serial('com1')
#%%
a = '1;1;'
ab = b'1;1;'

print("a:{}".format(type(a)))
print("ab:{}".format(type(ab)))
# %% Format specifier and then convert to bytes. 
a = '1;1;{}'.format(2).encode()
print("a:{}".format(type(a)))
# %%
a

# %%
