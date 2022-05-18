import pandas as pd
from sqlalchemy import create_engine

df = pd.read_csv('ZACKS-MT.csv')

engine = create_engine('mssql+pyodbc://ETL')

with engine.connect() as conn, conn.begin():
    df.to_sql(name='ZachsMasterTable', con=conn, schema='qdl', if_exists='append', index=False)

