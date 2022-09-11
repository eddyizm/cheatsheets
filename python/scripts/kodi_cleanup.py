''' script to delete viewed tv shows programmatically 
    currently setup for two paths where I store TV Shows. Others can be added, adapted or removed. 
    Database Schema is currently set up for Kodi Leia 
'''
import os
import sqlite3

db_file='<DB PATH>'


# delete files
def cleanFiles(filepath: str):
        if os.path.exists(filepath):
                os.remove(filepath)
                print('removed file: ', filepath)
        # else:
                 #print('file does not exist: ', filepath)


def main():
        print('Nightly Kodi CleanUp')
        conn = sqlite3.connect(db_file)
        c = conn.cursor()
        c.execute(''' select p.strPath || f.strFilename from files f join path p ON f.idPath = p.idPath  
                        WHERE f.playCount = 1 AND p.strPath LIKE '<REPLACE WITH FOLDER PATH>%' order by f.lastPlayed desc LIMIT 50; ''')
        result = list(c.fetchall())
        for f in result:
                cleanFiles(f[0])
        ''' Add additional paths here, eg for movies or other storage paths. '''
        # c.execute(''' select p.strPath || f.strFilename from files f join path p ON f.idPath = p.idPath 
        #                 WHERE f.playCount = 1 AND p.strPath LIKE '<REPLACE WITH FOLDER PATH>%' order by f.lastPlayed desc DESC LIMIT 50; ''')
        # result = list(c.fetchall())
        # for f in result:
        #         cleanFiles(f[0])
        conn.close()
     


if __name__ == "__main__":
        main()        