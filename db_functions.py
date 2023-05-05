# === some database commands ======

import pymysql
import db_config_file

class DatabaseError(Exception):
    def __init__(self, e):
        super().__init__(e)


# make this try statment we saw before as a function
#DatabaseError() is function that gets what went wrong with DB GUI communication in a pop up messsage

def open_database():
    try:
        con = pymysql.connect(host=db_config_file.DB_SERVER,
                              user=db_config_file.DB_USER,
                              password=db_config_file.DB_PASS,
                              database=db_config_file.DB,
                              port=db_config_file.DB_PORT)
        return con

    except pymysql.InternalError as e:
        print(e)
        raise DatabaseError(e)
    except pymysql.OperationalError as e:
        print(e)
        raise DatabaseError(e)
    except pymysql.NotSupportedError as e:
        print(e)
        raise DatabaseError(e)

#

def query_database(con, sql, values):

    try:
        cursor = con.cursor()
        cursor.execute(sql, values)
        rows = cursor.fetchall()
        num_of_rows = cursor.rowcount

    except pymysql.InternalError as e:
        print(e)
        raise DatabaseError(e)
    except pymysql.OperationalError as e:
        print(e)
        raise DatabaseError(e)
    except pymysql.ProgrammingError as e:
        print(e)
        raise DatabaseError(e)
    except pymysql.DataError as e:
        print(e)
        raise DatabaseError(e)
    except pymysql.IntegrityError as e:
        print(e)
        raise DatabaseError(e)
    except pymysql.NotSupportedError as e:
        print(e)
        raise DatabaseError(e)
    finally:
        cursor.close()
        con.close()
        return num_of_rows, rows



def insert_database(con, sql, values):
    try:
         cursor = con.cursor()
         cursor.execute(sql, values)
         con.commit()
         print("successfully inserted record")
    except (Exception) as error:
        print("Error while inserting data to MYSQL", error)
        exit()
    finally:
        cursor.close()
        con.close


