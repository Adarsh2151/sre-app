import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = 'localhost',
      user = 'root',
      password = 'this',
      db = 'bussiness';
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }
}

void main() {
  Mysql db = Mysql();
  print("fh");
  db.getConnection().then((conn) {
    String sql = 'select name from productdetail where id = 1;';
    conn.query(sql).then((results) {
      for (var row in results) {
        print(row);
      }
    });
    conn.close();
  });
}
