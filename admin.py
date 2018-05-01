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
    os.system('clear')
    print("SELAMAT DATANG DI \nKUIS ONLINE BAHASA INGGRIS")
    print("MENU ADMIN")
    print("1. Login")
    print("0. Keluar")
    return eval(input("Masukkan pilihan\n"))


def menu_admin():
    os.system('clear')
    print('1. Upload Soal')
    print('2. Lihat Soal')
    print('3. Delete Soal')
    print('4. Set Rentang Ujian')
    print('5. Set Durasi Ujian')
    print('0. Keluar')
    return eval(input("Masukkan pilihan\n"))


while True:
    pil = menu_awal()
    if pil == 1:
        os.system('clear')
        adm_user = input('Username :')
        adm_pass = getpass.getpass('Password :')
        if server.login_admin(adm_user, adm_pass) == True:
            print('Berhasil login sebagai admin')
            time.sleep(1)
            pil_admin = menu_admin()
            if pil_admin == 1:
                nama_file = input('Masukan nama file (format.csv)')
                print('Uploading...')
                lines = [line.rstrip('\n') for line in open(nama_file)]
                for i in range(len(lines)):
                    server.upload_soal(lines[i])
                print('Upload berhasil.')
                time.sleep(0.5)
            elif pil_admin == 2:
                soal = server.lihat_soal()
                for i in range(len(soal)):
                    print(soal[i], '\n')
                input('Tekan enter / karakter apapun untuk lanjut')
            elif pil_admin == 3:
                os.system('clear')
                print('Mendelete soal...')
                server.delete_soal()
                print("Soal berhasil dihapus.")
                input('Tekan enter / karakter apapun untuk lanjut')
            elif pil_admin == 4:
                os.system('clear')
                waktu_mulai = input("Masukan jam mulai kuis : \n")
                waktu_selesai = input("Masukan jam selesai kuis : \n")
                if server.set_start_time(waktu_mulai) and server.set_end_time(waktu_selesai):
                    print('Waktu mulai dan waktu selesai berhasil di set pada')
                    print(f'Pukul {waktu_mulai} - {waktu_selesai}')
                    time.sleep(2)
            else:
                os.system('clear')
                durasi = input("Masukan durasi kuis (satuan menit) : \n")
                server.set_durasi(durasi)
                print(f'Durasi ujian telah di set sebesar {durasi} menit')
                # print(f'waktu saat ini adalah : \n{time.ctime()}')
                # print(
                #     f'Akan selesai pada : \n{time.ctime(server.waktu_selesai())}')
                # input()
        else:
            print('Salah username / password')
            time.sleep(0.5)
            os.system('clear')

    else:
        break
