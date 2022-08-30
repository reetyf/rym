import pandas as pd
import numpy as np
import glob

img_path = 'Exports/*'
glob1 = glob.glob(img_path)
glob2 = np.array(glob1)
df = pd.DataFrame()
for one_file in glob2:
    print(one_file)
    df_chunk = pd.read_csv(one_file, sep='\t', engine='python')
    df = pd.concat([df, df_chunk], axis=0)

np.savetxt('artists.txt', df['Artist'],fmt='%s',delimiter=',')