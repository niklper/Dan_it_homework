#!/bin/bash
set -e

PACKAGES=(
  python3
  python3-pip
  python3-venv
  stress
)

APP_DIR="/opt/flaskapp"
APP_PORT="80"

function info() {
    local msg=$1
    echo "### Info: $1"
}

function patch_sshd() {
    info "Patching SSH"
    echo "ubuntu:${ssh_password}" | chpasswd
    sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
    sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
    rm -rf /etc/ssh/sshd_config.d/*.conf
    systemctl restart ssh
}

function install_prerequisites() {
  info "Updating repos"
  apt-get update -y 1>/dev/null

  for package in "$${PACKAGES[@]}";do
    info "Installing package: [$${package}]"
    apt-get install -y "$${package}" 1>/dev/null
  done
}

function creating_application() {
    info "Creating application dir"
    mkdir -p "$${APP_DIR}"

    info "Creating simple application"
    cat << EOF > "$${APP_DIR}/app.py"
from flask import Flask
app = Flask(__name__)

@app.route("/")
def heavy():
    x = 0
    for i in range(10**7):
        x += i
    return f"Done: {x}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=$${APP_PORT})
EOF

    info "Changing owner of [$${APP_DIR} to [$${USER}]]"
    chown -R $USER:$USER /opt/flaskapp
}

function install_app_dependencies() {
    info "Creating Virtual Environment"
    python3 -m venv $${APP_DIR}/venv

    info "Activating Venv"
    source /opt/flaskapp/venv/bin/activate

    info "Installing Flask"
    pip install flask
}

function run_application() {
  nohup $${APP_DIR}/venv/bin/python $${APP_DIR}/app.py > $${APP_DIR}/flask.log 2>&1 &
}

function run_fake_cpu_load() {
  nohup stress --cpu "$(nproc)" --timeout 600 &
  nohup stress --cpu 2 --timeout 600 &
  nohup bash -c 'while :; do :; done' > /dev/null 2>&1 &
}

function main() {
    install_prerequisites
    patch_sshd
    creating_application
    install_app_dependencies
    run_application
    run_fake_cpu_load
}

main
