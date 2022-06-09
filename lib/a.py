import mysql.connector as connector


class DBHelper:
    def __init__(self):
        self.con = connector.connect(host="localhost",
                                     port="3306",
                                     user="root",
                                     password="this",
                                     database="pythontest")
        query = "create table if not exists user(userId int primary key,userName varchar(200),phone varchar(12))"
        cur = self.con.cursor()
        cur.execute(query)
        print("created")

    def insert_user(self, userid, username, phone):
        query = 'insert into user(userId,userName,phone) values({},"{}","{}")'.format(userid, username, phone)
        print(query)
        cur = self.con.cursor()
        cur.execute(query)
        self.con.commit()
        print("user saved to db")

    def fetch_all(self):
        query = "select * from user"
        cur = self.con.cursor()
        cur.execute(query)
        for row in cur:
            print("UserId : ",row[0])
            print("UserName : ",row[1])
            print("Phone : ",row[2])
            print()
            print()

    def fetch_one(self,n):
        query = "select * from user"
        cur = self.con.cursor()
        cur.execute(query)
        for row in cur:
            if row[0] == n:
                print(f" UserName : {row[1]}\n User Phone : {row[2]} \n\n")

    def delete_user(self, userId):
        query = "delete from user where userId= {}".format(userId)
        c = self.con.cursor()
        c.execute(query)
        self.con.commit() # use for permanent delete
        print("deleted")

    def update_user(self, userId,newName,newPhone):
        query = "update user set userName='{}',phone='{}' where userId={}".format(newName,newPhone,userId)
        cur = self.con.cursor()
        cur.execute(query)
        self.con.commit()
        print("updated")



helper = DBHelper()
helper.update_user(3,"Keshav","6207815052")
# helper.fetch_all()
# helper.delete_user(2)
# helper.fetch_all()
# helper.delete_user(1)
# helper.fetch_all()
# helper.fetch_one(3)

# helper.insert_user(2,"Abhi","245157855")
# helper.insert_user(3,"Ankit","245157855")
# helper.insert_user(4,"Anurag","245157855")
