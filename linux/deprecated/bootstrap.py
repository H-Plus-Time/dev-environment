import platform
import subprocess
import os


def main():
    #print(platform.dist()[0])
    x =  "{}.sh".format(os.path.join(os.path.expanduser("~/dev-environment"), platform.dist()[0]))
    print x
    return x

if __name__ == '__main__':
    main()
