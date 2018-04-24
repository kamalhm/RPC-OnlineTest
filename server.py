from xmlrpc.server import SimpleXMLRPCServer
import pymysql

IP = 'localhost'
PORT = 8000
PORT_UP = 8001
DB_SERVER = 'localhost'
DB_USER = 'root'
DB_PASS = ''
DB_NAME = 'sister'
server = SimpleXMLRPCServer((IP, PORT), allow_none=True)
print("Listening on port", PORT)
db = pymysql.connect(DB_SERVER, DB_USER, DB_PASS, DB_NAME)
cursor = db.cursor()


def login_admin(username, password):
    admin = []
    query = "select * from admin"
    cursor.execute(query)
    admin = cursor.fetchall()
    for i in range(len(admin)):
        if admin[i][0] == username and admin[i][1] == password:
            return True
    return False


def login_user(username, password):
    peserta = []
    query = "select * from peserta"
    cursor.execute(query)
    peserta = cursor.fetchall()
    for i in range(len(peserta)):
        if peserta[i][0] == username and peserta[i][1] == password:
            return True
    return False


def delete_soal():
    cursor.execute("delete from soal_materi")
    db.commit()
    return True


def upload_soal(data):
    isi = data.split(',')
    print(isi)
    query = "INSERT INTO `soal_materi` (`id_soal`, `soal`, `option_a`, \
    `option_b`, `option_c`, `option_d`, `kunci_jawaban`) \
    VALUES ('{a}', '{b}', '{c}', '{d}', '{e}', '{f}', '{g}')".format(
        a=isi[0], b=isi[1], c=isi[2], d=isi[3], e=isi[4], f=isi[5], g=isi[6])
    print(query)
    cursor.execute(query)
    db.commit()
    return True


def lihat_soal():
    soal = []
    query = "select * from soal_materi"
    cursor.execute(query)
    soal = cursor.fetchall()
    return soal

def lihat_jawaban(peserta):
    jawaban = []
    query = "select * from soal_peserta where id_peserta= %s ".%peserta
    cursor.execute(query)
    jawaban = cursor.fetchall()
    return jawaban

server.register_function(login_admin, 'login_admin')
server.register_function(login_user, 'login_user')
server.register_function(upload_soal, 'upload_soal')
server.register_function(lihat_soal, 'lihat_soal')
server.register_function(delete_soal, 'delete_soal')
server.register_function(lihat_jawaban, 'lihat_jawaban')
server.serve_forever()
