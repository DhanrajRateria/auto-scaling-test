# Auto-Scaling Test Project  

## Overview  
This project demonstrates the implementation of an **Auto-Scaling Infrastructure** using Kubernetes, custom scripts, and Terraform. The repository contains structured directories for deploying, testing, and managing auto-scaling capabilities across cloud-native environments.  

## Features  
- **Kubernetes Auto-Scaling**  
  - Horizontal Pod Autoscaler (HPA) for scaling pods based on CPU or custom metrics.  
  - Cluster Autoscaler for dynamic node scaling.  

- **Terraform Infrastructure as Code (IaC)**  
  - Automated provisioning of cloud infrastructure.  
  - Scalable Kubernetes cluster deployment.  

- **Custom Scripts**  
  - Metrics collection and monitoring.  
  - Load simulation for auto-scaling tests.  
  - Cleanup and teardown scripts for infrastructure.  

## Repository Structure  
```plaintext  
auto-scaling-test/  
├── k8s/  
│   ├── hpa.yaml              # Kubernetes Horizontal Pod Autoscaler configuration  
│   ├── deployment.yaml       # Kubernetes deployment with scaling enabled  
│   ├── service.yaml          # Service configuration for the deployment  
│   ├── cluster-autoscaler/   # Cluster Autoscaler configurations  
│       ├── clusterrole.yaml  # RBAC for Cluster Autoscaler  
│       └── deployment.yaml   # Deployment for Cluster Autoscaler  
├── scripts/  
│   ├── load_test.py          # Python script for simulating load  
│   ├── metrics_collector.py  # Script for collecting scaling metrics  
│   ├── cleanup.sh            # Script for tearing down infrastructure  
├── terraform/  
│   ├── main.tf               # Core Terraform configuration file  
│   ├── variables.tf          # Input variables for the Terraform module  
│   ├── outputs.tf            # Outputs for the Terraform setup  
│   ├── provider.tf           # Provider configuration (e.g., AWS, GCP)  
│   └── modules/              # Reusable Terraform modules for scaling infrastructure  
└── README.md                 # Documentation (this file)  
```

## Prerequisites
### Tools:

- Kubernetes cluster (minikube, kind, or managed cloud service).
- Terraform (v1.0 or above).
- Python 3.x (for scripts).
- kubectl CLI.
- Cloud Provider Access:
  -- AWS, GCP, or Azure account configured for Terraform.

## Getting Started
1. Clone the Repository
```bash
git clone https://github.com/<username>/auto-scaling-test.git  
cd auto-scaling-test
```

2. Deploy Infrastructure
Navigate to the terraform/ directory to provision the required infrastructure.

```bash
cd terraform  
terraform init  
terraform apply
```

3. Deploy Kubernetes Resources
Apply the Kubernetes configurations from the k8s/ directory.

```bash
kubectl apply -f k8s/
```

4. Simulate Load
Run the load testing script to observe auto-scaling behavior.
```bash
cd scripts  
python3 load_test.py
```
  
5. Monitor Metrics
Use the metrics collection script or cloud provider dashboards to monitor scaling.
```bash
python3 metrics_collector.py
```
  
6. Clean Up Resources
After testing, clean up all deployed resources.

```bash
bash scripts/cleanup.sh
```
  
## Configuration
### Terraform Variables:
Edit terraform/variables.tf to configure cluster size, region, and other parameters.

### Kubernetes HPA:
Modify k8s/hpa.yaml to change scaling thresholds and resource limits.

### Load Test Script:
Customize scripts/load_test.py to simulate different load patterns.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request with detailed changes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
