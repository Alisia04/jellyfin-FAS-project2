# Self-hosted infrastructure with Jellyfin

## Disclaimer

All the media downloaded for this project are under CC-BY licence and are used ONLY to demonstrate that the demo is working
## About the project

The goal is to build a media server with Jellyfin (a free software, community build media structure) and monitor it with Grafana, Prometheus and cAdvisor. All of that is orchestrated with Docker

---
## Project Structure:

```
Jellyfin-FAS-project/
 ├── ansible/
  |    └── tasks/
  |    └── site.yml
 ├── docker/
  |    ├── grafana/
	   |	 └── dashboard.json
	   |	 └── provisioning/
  |    ├── prometheus/
  |    ├── docker-compose.yml
 ├── media/
 ├── scripts/
 ├── README.md
 └── .gitignore
```
- - -
## Setup and guide
### Requirements:
To run the project, you need **Docker** and **Ansible** installed on the machine
### Setup:
#### Option 1: use Ansible (recommended)
I recommend this way since it's all automated (from the repo cloning to the start of the services)
```
cd Ansible/
ansible-playbook site.yml
```
#### Option 2: use "setup.sh"
If the Ansible script doesn't work or Ansible is not installed on the machine, you can use this.
```
./scripts/setup.sh
```
This script triggers `update.sh`, `download-media.sh`, `start.sh`, `status.sh`
### Guide to use:
Open the following links for:
- Jellyfin: http://localhost:8096
- Grafana: http://localhost:3000
- Prometheus: http://localhost:9090
- cAdvisor: http://localhost:8080
- - - 
## Author:
Alisia Wegher
