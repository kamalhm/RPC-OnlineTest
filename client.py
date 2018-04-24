import xmlrpc.client
import getpass
import os
import time

SERVER_IP = 'localhost'
SERVER_PORT = '8000'
server = xmlrpc.client.ServerProxy(
    'http://{ip}:{port}'.format(ip=SERVER_IP, port=SERVER_PORT)
)



def menu_awal():
    os.system('cls')
    print("SELAMAT DATANG DI \nKUIS ONLINE BAHASA INGGRIS")
    print("---MENU---")
    print("1. Login Admin")
    print("2. Login User")
    print("3. Exit")


def menu_admin():
    os.system('cls')
    print('---Menu Admin---')
    print('1. Upload Soal')
    print('2. Lihat Soal')
    print('3. Delete Soal')
    print('4. Nanti aja ah, mau logout dulu')


def menu_user():
    os.system('cls')
    print('---Menu User---')
    print('1. Mulai Kuis')
    print('2. Lihat Nilai')
    print('3. Lihat Jawaban')




while True:
    valid_admin = False
    valid_user = False
    os.system('cls')
    menu_awal()
    pilihan = eval(input('Masukan pilihan :'))
    if pilihan == 1:
        while True:
            os.system('cls')
            if valid_admin==False:
                adm_user = input('Username :')
                adm_pass = input('Password :')
                valid_admin = server.login_admin(adm_user, adm_pass)
            if valid_admin:
                print('Logged-in Sebagai : Admin')
                time.sleep(0.5)
                menu_admin()
                pilihan = eval(input('Masukan pilihan :'))
                if pilihan == 1:
                    nama_file = input('Masukan nama file (format .csv)')
                    print('uploading...')
                    lines = [line.rstrip('\n') for line in open(nama_file)]
                    for i in range(len(lines)):
                        server.upload_soal(lines[i])
                    menu_admin()
                    pilihan = eval(input('Masukan pilihan :'))
                elif pilihan == 2:
                    soal = server.lihat_soal()
                    for i in range(len(soal)):
                        print(soal[i], '\n')
                    print('Setelah Soal, ada apa ya')
                    time.sleep(0.5)
                    # time.sleep(2)
                elif pilihan == 3:
                    server.delete_soal()
                    print("Soal Deleted")
                    time.sleep(0.5)

                elif pilihan == 4:
                    valid_admin==False
                    print("Log Out Successful")
                    time.sleep(0.5)
                    break
            else:
                os.system('cls')
                print('Salah password/username')
                time.sleep(0.5)
                os.system('cls')
                break
    elif pilihan == 2:
        while True:
            os.system('cls')
            if valid_user==False:
                usr_user = input('Username :')
                usr_pass = input('Password :')
                valid_user = server.login_user(usr_user, usr_pass)
            if valid_user:
                print('Logged-in sebagai : User')
                time.sleep(0.5)
                os.system('cls')
                menu_user()
                if pilihan == 1:
                    print("under construction")
                    menu_user()
                    pilihan = eval(input('Masukan pilihan :'))
                elif pilihan == 2:
                    print("under construction")
                    menu_user()
                    pilihan = eval(input('Masukan pilihan :'))
                elif pilihan == 3:
                    print("under construction")
                    menu_user()
                    pilihan = eval(input('Masukan pilihan :'))
                elif pilihan == 4:
                    valid_user == False
                    print("Log Out Successful")
                    time.sleep(0.5)
                    break
            else:
                print('Salah password/username')
                time.sleep(0.5)
                os.system('cls')
                break
    elif pilihan==3:
        print("Thank you")
        time.sleep(0.5)
        break