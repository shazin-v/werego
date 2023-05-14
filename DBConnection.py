import mysql.connector


mydb =mysql.connector.connect(host="localhost", user="root", passwd="")

class Db:
    def __init__(self):
        self.cnx = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="EV_DB"
            )
        self.cur = self.cnx.cursor(dictionary=True,buffered=True)

    def select(self, q, params=None):
        self.cur.execute(q, params)
        return self.cur.fetchall()

    def selectOne(self, q, params=None):
        self.cur.execute(q, params)
        return self.cur.fetchone()

    def insert(self, q, params=None):
        self.cur.execute(q, params)
        self.cnx.commit()
        return self.cur.lastrowid

    def update(self, q, params=None):
        self.cur.execute(q, params)
        self.cnx.commit()
        return self.cur.rowcount

    def delete(self, q, params=None):
        self.cur.execute(q, params)
        self.cnx.commit()
        return self.cur.rowcount







# Sure, here is an example Python code to retrieve the filter options and data for each drop-down option of Select a city, Select a charging station, and Select Charging Type from the charging_station_list table:




# import sqlite3

# # Connect to the database

# conn = sqlite3.connect('charging_station_data.db')


# # Create a cursor object

# cur = conn.cursor()

# # Get the filter options for Select a city

# cur.execute("SELECT DISTINCT city FROM charging_station_list;")
# cities = cur.fetchall()
# print("Filter options for Select a city:")
# for city in cities:
#     print(city[0])

# # Get the filter options for Select a charging station

# cur.execute("SELECT DISTINCT charging_station_name FROM charging_station_list;")
# charging_stations = cur.fetchall()
# print("\nFilter options for Select a charging station:")
# for station in charging_stations:
#     print(station[0])

# # Get the filter options for Select Charging Type

# cur.execute("SELECT DISTINCT charging_type FROM charging_station_list;")
# charging_types = cur.fetchall()
# print("\nFilter options for Select Charging Type:")
# for charging_type in charging_types:
#     print(charging_type[0])

# # Close the cursor and connection

# cur.close()
# conn.close()