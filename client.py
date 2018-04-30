import xmlrpc.client
import getpass
import os
import time
from prettytable import PrettyTable

SERVER_IP = 'localhost'
SERVER_PORT = '8002'
server = xmlrpc.client.ServerProxy(
    'http://{ip}:{port}'.format(ip=SERVER_IP, port=SERVER_PORT)
)


def menu_awal():
    os.system('cls')
    t = PrettyTable(["SELAMAT DATANG DI KUIS ONLINE BAHASA INGGRIS"])
    t.align["SELAMAT DATANG DI KUIS ONLINE BAHASA INGGRIS"] = 'l'
    t.add_row(['1. Login Admin'])
    t.add_row(['2. Login User'])
    t.add_row(['3. Exit'])
    print(t)


def menu_admin():
    os.system('cls')
    temp = server.get_nama_admin(usr_user)[0]
    t = PrettyTable(["SELAMAT DATANG : %s\n"%temp])
    t.align["SELAMAT DATANG : %s\n"%temp] = 'l'
    t.add_row(['1. Upload Soal'])
    t.add_row(['2. Lihat Soal'])
    t.add_row(['3. Delete Soal'])
    t.add_row(['4. Log-out'])
    print(t)


def menu_user():
    os.system('cls')
    temp = server.get_nama_peserta(usr_user)[0]
    t = PrettyTable(["SELAMAT DATANG : %s\n"%temp])
    t.align[i[1]] = 'l'
    t.add_row(['1. Mulai Kuis'])
    t.add_row(['2. Lihat Nilai'])
    t.add_row(['3. Lihat Jawaban'])
    t.add_row(['4. Log-out'])
    print(t)


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
                usr_user = input('Username :')
                usr_pass = getpass.getpass('Password :')
                valid_user = server.login_admin(usr_user, usr_pass)
            if valid_admin:
                menu_admin()
                pilihan = eval(input('Masukkan pilihan :'))
                if pilihan == 1:
                    nama_file = input('Masukkan nama file (format .csv)')
                    print('uploading...')
                    lines = [line.rstrip('\n') for line in open(nama_file)]
                    for i in range(len(lines)):
                        server.upload_soal(lines[i])
                    menu_admin()
                    pilihan = eval(input('Masukan pilihan :'))
                    if pilihan == 1:
                        nama_file = input('Masukan nama file (format .csv)')
                        print('Uploading...')
                        lines = [line.rstrip('\n') for line in open(nama_file)]
                        for i in range(len(lines)):
                            server.upload_soal(lines[i])
                        print("Enter to lanjutkan")
                        input()
                    elif pilihan == 2:
                        soal = server.lihat_soal()
                        for i in range(len(soal)):
                            print(soal[i], '\n')
                        print('Setelah Soal')
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
                usr_pass = getpass.getpass('Password :')
                valid_user = server.login_user(usr_user, usr_pass)
            if valid_user:
                menu_user()
                pilihan = eval(input('Masukan pilihan :'))
                if pilihan == 1:
                    soal = []
                    print("mulai kuis")
                    print("selesaikan dalam 10 menit")
                    time.sleep(1)
                    soal = server.get_soal()
                    waktu_mulai = server.waktu_mulai()
                    waktu_selesai = server.waktu_selesai()
                    print("waktu mulai: ",time.ctime(waktu_mulai))
                    print("waktu selesai: ",time.ctime(waktu_selesai))
                    jawab = []
                    for i in soal :
                        os.system('cls')
                        if (time.time() > waktu_selesai):
                            print("waktu habis")
                            time.sleep(3)
                            break                    
                        t = PrettyTable([i[1]])
                        t.align[i[1]] = 'l'
                        t.add_row(["a. %s"%i[3]])
                        t.add_row(["b. %s"%i[4]])
                        t.add_row(["c. %s"%i[5]])
                        t.add_row(["d. %s"%i[6]])
                        print(t)
                        while True:
                            jaw = input("masukkan jawaban(a/b/c/d) : ")
                            if (jaw == 'a') or (jaw == 'b') or (jaw == 'c') or (jaw == 'd'):
                                break
                            else :
                                print("jawaban tidak benar")
                        jawab.append(jaw)
                    nilai = 0
                    print(jawab)
                    for i in range(len(jawab)) :
                        if (soal[i][2] == jawab[i]):
                            nilai += 5
                    print("Nilai Anda adalah : ",nilai)
                    server.upload_nilai(nilai,usr_user,usr_pass)
                    print("Nilai Anda sudah diupload")
                    for i in range((len(soal)-len(jawab))):
                        jawab.append('f')
                    server.upload_soal_peserta(soal,usr_user,jawab)
                    print("Enter to lanjutkan")
                    input()

                elif pilihan == 2:
                    os.system('cls')
                    nilai = server.lihat_nilai(usr_user)[0]
                    if not nilai:
                        temp = server.get_nama_peserta(usr_user)[0]
                        print("%s, anda belum mulai kuis."%temp)
                        time.sleep(2)
                    else:
                        temp = server.get_nama_peserta(usr_user)[0]
                        print("Hai %s, nilai anda adalah = %d"% (temp,nilai))
                        print("Enter to lanjutkan")
                        input()
                elif pilihan == 3:
                    os.system('cls')
                    jawaban = server.lihat_jawaban(usr_user)
                    if not jawaban:
                        temp = server.get_nama_peserta(usr_user)[0]
                        print("%s, anda belum mulai kuis."%temp)
                        time.sleep(2)
                    else:
                        print("---Lihat Jawaban---")
                        t = PrettyTable(['Soal', 'Jawaban Anda', 'Kunci Jawaban'])
                        for isi in jawaban:
                            t.add_row(isi)
                        print(t)
                        print('Enter to lanjutkan')
                        input()
                elif pilihan == 4:
                    valid_user == False
                    print("Log Out Successful")
                    time.sleep(0.5)
                    os.system('cls')
                    break
    elif pilihan==3:
        print("Thank you")
        time.sleep(0.5)
        break