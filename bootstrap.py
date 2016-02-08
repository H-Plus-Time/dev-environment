import platform
import subprocess

def main():
    subprocess.popen("{}.sh".format(platform.dist()[0]))

if __name__ == '__main__':
    main()
