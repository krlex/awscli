#!/bin/sh -uxe

aws_cli(){
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  sudo rm -rf aws/
}

prepare_ubuntu() {
        sudo  apt update -y
        sudo  apt dist-upgrade -y
        sudo  apt install curl vim unzip -y

        aws_cli

        echo
        echo "   Ubuntu Sytem ready for AWS Client."
        echo
}

prepare_debian() {
        sudo apt update -y
        sudo apt dist-upgrade -y
        sudo apt install curl vim unzip -y


        aws_cli

        echo
        echo "   Debian System ready for AWS Client."
        echo
}

prepare_fedora() {
        sudo dnf update -y
        sudo dnf install vim curl unzip -y

        aws_cli

        echo
        echo "   Fedora System ready for AWS Client."
        echo
}

prepare_centos() {
        sudo yum update -y
        sudo yum install vim curl unzip -y

        aws_cli

        echo
        echo "   CentOS System ready for AWS Client."
        echo
}

if [  -f /etc/os-release ]; then
        . /etc/os-release
elif [ -f /etc/debian_version ]; then
      $ID=debian
fi

case $ID in
        'ubuntu')
                prepare_ubuntu
        ;;
        'debian')
                prepare_debian
        ;;
        'fedora')
                prepare_fedora
        ;;
        'centos')
                prepare_centos
        ;;

        *)
                usage
        ;;
esac
