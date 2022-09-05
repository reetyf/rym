import pandas as pd
import numpy as np
import glob

img_path = 'Exports/*.csv'
glob1 = glob.glob(img_path)
glob2 = np.array(glob1)
df = pd.DataFrame()

for one_file in glob2:
    df_chunk = pd.read_csv(one_file, sep='\t', engine='python')
    df = pd.concat([df, df_chunk], axis=0)
artists = df['Artist'].tolist()

#only first artist in "artist 1 / artist 2"
for art in artists:
    if('/' in art):
        artists.remove(art)
    elif(not art.isascii()):
        artists.remove(art)

#remove dupes
artists= list(set(artists))


#to txt file
np.savetxt('artists.txt', artists ,fmt = '%s',delimiter='/',newline='\n')