import os

def main():
  network = str(input("Please input range network: "))
  for i in range(1,254,1):
    cmd = "ping -c 1 " str(network) + "." + str(i) + """ | grep "64 bytes" | cut -d " " -f 4 | sed 's/.$//g' &"""
    i += 1
    os.system(cmd)
    
if __name__ == "__main__":
  main()
