import pandas as pd

# read in path
df = pd.read_csv("*******")

#explode genres
df1 = pd.Series(df['Genres']).str.get_dummies(sep=', ')

#remove inconsquential columns
for column in df1.columns:
    if(df1[column].sum() <10):
      df1.drop(column,axis=1,inplace = True)


#concat with original and drop redundant genres column now
df = pd.concat([df,df1],axis=1)
df.drop('Genres',axis = 1, inplace = True)


#normalize version of date, then only take the year
df['Date'] = pd.to_datetime(df['Date'])
df['Date'] = pd.DatetimeIndex(df['Date']).year

#export
from sqlalchemy import create_engine

db_connection_str = 'mysql+pymysql://****:****@******/rym'
db_connection = create_engine(db_connection_str)

df.to_csv('ch.csv')
df.to_sql('top', con=db_connection, if_exists='replace',index = False)