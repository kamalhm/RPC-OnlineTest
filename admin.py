import xmlrpc.client
import getpass
import os
import time
from prettytable import PrettyTable


# SERVER_IP = 'localhost'
# SERVER_PORT = '8000'
SERVER_IP = input("Masukan IP server tujuan : \n")
SERVER_PORT = '8000'

server = xmlrpc.client.ServerProxy(
    'http://{ip}:{port}'.format(ip=SERVER_IP, port=SERVER_PORT)
)


def menu_awal():
    os.system('cls')
    t = PrettyTable(["SELAMAT DATANG ADMIN DI KUIS ONLINE BAHASA INGGRIS"])
    t.align["SELAMAT DATANG ADMIN DI KUIS ONLINE BAHASA INGGRIS"] = 'l'
    t.add_row(['1. Login Admin'])
    t.add_row(['0. Exit'])
    print(t)


def menu_admin():
    os.system('cls')
    temp = server.get_id_admin(usr_user)
    t = PrettyTable(["SELAMAT DATANG : "+temp])
    t.align["SELAMAT DATANG : "+temp] = 'l'
    t.add_row(['1. Upload Soal'])
    t.add_row(['2. Lihat Soal'])
    t.add_row(['3. Delete Soal'])
    t.add_row(['4. Set Rentang Ujian'])
    t.add_row(['5. Set Durasi Ujian'])
    t.add_row(['0. Log-out'])
    print(t)


while True:
    valid_admin = False
    os.system('cls')
    menu_awal()
    pilihan = eval(input('Masukan pilihan :'))
    if pilihan == 1:
        while True:
            os.system('cls')
            if valid_admin == False:
                usr_user = input('Username :')
                usr_pass = getpass.getpass('Password :')
                valid_admin = server.login_admin(usr_user, usr_pass)
            if valid_admin:
                menu_admin()
                pilihan = eval(input('Masukkan pilihan :'))
                if pilihan == 1:
                    nama_file = input('Masukkan nama file (format .csv)')
                    print('uploading...')
                    lines = [line.rstrip('\n')
                             for line in open(f'{nama_file}.csv')]
                    for i in range(len(lines)):
                        server.upload_soal(lines[i])
                    print("Enter to lanjutkan")
                    input()
                elif pilihan == 2:
                    soal = server.lihat_soal()
                    for i in range(len(soal)):
                        print(soal[i], '\n')
                    time.sleep(0.5)
                    print("Enter to lanjutkan")
                    input()
                elif pilihan == 3:
                    server.delete_soal()
                    print("Soal Deleted")
                    time.sleep(0.5)
                    print("Enter to lanjutkan")
                    input()

                elif pilihan == 4:
                    os.system('cls')
                    waktu_mulai = input("Masukan jam mulai kuis : \n")
                    waktu_selesai = input("Masukan jam selesai kuis : \n")
                    if server.set_start_time(waktu_mulai) and server.set_end_time(waktu_selesai):
                        print(
                            'Waktu mulai dan waktu selesai berhasil di set pada')
                        print(f'Pukul {waktu_mulai} - {waktu_selesai}')
                        time.sleep(2)
                elif pilihan == 5:
                    os.system('cls')
                    durasi = input(
                        "Masukan durasi kuis (satuan menit) : \n")
                    server.set_durasi(durasi)
                    print(
                        f'Durasi ujian telah di set sebesar {durasi} menit')
                    time.sleep(3)

                elif pilihan == 0:
                    valid_admin == False
                    print("Log Out Successful")
                    time.sleep(0.5)
                    break
            else:
                os.system('cls')
                print('Salah password/username')
                time.sleep(0.5)
                os.system('cls')
                break
    elif pilihan == 0:
        print("Thank you")
        time.sleep(0.5)
        break
