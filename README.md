# Secure Docker App

A Python Flask application with automated security scanning.

## Features
- Automated vulnerability scanning with Trivy
- Weekly scheduled scans
- Non-root container user
- Pinned dependency versions

## Setup
1. Clone this repository
2. Run `docker build -t secure-app .`
3. Execute `docker run -p 5000:5000 secure-app`
