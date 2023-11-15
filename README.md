Scripts de pós-instalação do Ubuntu para automação da instalação das minhas ferramentas e linguaguens usadas em programação e DevOps: 

### Desktop

+ [Docker](https://docs.docker.com/engine/install/ubuntu/)
    + [Portainer](https://docs.portainer.io/start/install-ce/server/docker/linux)
+ Neofetch
+ Git
+ Java - OpenJDK 17
+ [NodeJs via snap](https://snapcraft.io/node)
+ [Go via snap](https://snapcraft.io/go)
+ Python - PIP
    + Virtualenv
+ [DBeaver - CE](https://www.edivaldobrito.com.br/dbeaver-no-ubuntu-e-derivados/)
+ [Insominia](https://docs.insomnia.rest/insomnia/install)
+ [VS Code](https://code.visualstudio.com/docs/setup/linux)
+ [VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads)
+ [Vagrant](https://developer.hashicorp.com/vagrant/downloads)

### WSL

+ Neofetch
+ [sdkman](https://sdkman.io/install)
+ Java 20.0.2 via sdkman
+ Maven 3.6.3 via sdkman

### Como rodar :

1. Clone o repositório e abra o diretório

~~~bash
$ git clone https://github.com/adelsonsljunior/pos-instalacao-ubuntu.git
$ cd pos-instalacao-ubuntu/
~~~

2. Escolha qual script de instalação deseja usar

+ Desktop

~~~bash
$ sh desktop/desktop.sh
~~~

+ WSL

~~~bash
$ sh wsl/wsl.sh
~~~

<br>

![Bash](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![WSL](https://img.shields.io/badge/WSL-0a97f5?style=for-the-badge&logo=linux&logoColor=white)

