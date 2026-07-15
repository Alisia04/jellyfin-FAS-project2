#!/bin/bash

# =====================================================
# Jellyfin Infrastructure Status
# =====================================================

GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

check_command() {
    if command -v "$1" &>/dev/null; then
        echo -e "${GREEN}✓${RESET}"
    else
        echo -e "${RED}✗${RESET}"
    fi
}

check_container() {
    if docker ps --format '{{.Names}}' | grep -qw "$1"; then
        echo -e "${GREEN}Running${RESET}"
    else
        echo -e "${RED}Stopped${RESET}"
    fi
}

check_url() {
    if curl -fs "$1" >/dev/null 2>&1; then
        echo -e "${GREEN}Reachable${RESET}"
    else
        echo -e "${RED}Not reachable${RESET}"
    fi
}

echo
echo -e "${BLUE}=========================================${RESET}"
echo -e "${BLUE} Jellyfin Infrastructure Status${RESET}"
echo -e "${BLUE}=========================================${RESET}"
echo

echo "Requirements"
printf "Docker:          "
check_command docker

printf "Docker Compose:  "
docker compose version >/dev/null 2>&1 && \
echo -e "${GREEN}✓${RESET}" || \
echo -e "${RED}✗${RESET}"

echo
echo "Containers"

printf "Jellyfin:        "
check_container jellyfin

printf "Prometheus:      "
check_container prometheus

printf "Grafana:         "
check_container grafana

printf "cAdvisor:        "
check_container cadvisor

echo
echo "Services"

printf "Jellyfin:        "
check_url http://localhost:8096

printf "Prometheus:      "
check_url http://localhost:9090

printf "Grafana:         "
check_url http://localhost:3000

printf "cAdvisor:        "
check_url http://localhost:8080

echo
echo "Useful URLs"

echo "Jellyfin   : http://localhost:8096"
echo "Prometheus : http://localhost:9090"
echo "Grafana    : http://localhost:3000"
echo "cAdvisor   : http://localhost:8080"

echo
echo "Running containers"

docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo