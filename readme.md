# Kind Ansible Cluster

This cluster is designed to allow quick prototyping of k8s.

It is deployed and configured using Ansible to allow a number of base level configurations.

## Dependencies

* [ansible 2.9+](https://github.com/ansible/ansible)
* [kind](https://github.com/kubernetes-sigs/kind/)
* [helm3](https://helm.sh/docs/intro/install/)
* [docker](https://www.docker.com/)

## Features

* CNI Networking
* metallb loadbalancers
* Grafana and Prometheus Monitoring
* Traefik V2, socat proxy forwarders for metallb
* Nginx, socat proxy forwarders for metallb

### Python Dependencies

To ensure python dependencies.

```shell
pip3 install -r requirements.txt --user
```

### Ansible Galaxy Collection Dependencies

```shell
ansible-galaxy collection install -r requirements.yml
```

## Variables

| Variables          | Default | Description                                                                                            |
| ------------------ | :-----: | ------------------------------------------------------------------------------------------------------ |
| cluster_reset      |  False  | This will delete and re-install the kind cluster                                                       |
| docker_config      |  True   | Inject docker config from user into cluster                                                            |
| kind_workers       |    3    | Number of Kind Worker Nodes                                                                            |
| external_api       |  False  | Allow access to the k8s api via 0.0.0.0 *Security Goose says this is dangerous use at your own peril.* |
| kubernetes_version |   ""    | Use Kind image to define k8s [image](https://github.com/kubernetes-sigs/kind/releases).                |
| cni_network        | calico  | Set to either "" or calico for installing network                                                      |
| metallb_enabled    |  True   | Metallb Load Balancer                                                                                  |
| ingress_enabled    |  True   | Configure a Ingress                                                                                    |
| ingress_type       | traefik | Nginx/Traefik                                                                                          |
| monitoring_enabled |  False  | Prometheus installation for testing monitoring                                                         |

## Install

```shell
ansible-playbook start-local-cluster.yml
```

![cli-example](kind-cluster.gif)

## Clean up

```shell
ansible-playbook start-local-cluster.yml -t clean
```

## Todo

* Add additional CNI providers.
* Allow configuring of versions for various services, eg. ingress, monitoring.
* Inject values into config for ingress, monitoring helm charts.
* Make configuration more plugable.

## Future

Outside of creating the above basic configurations no other features and or functionality is expected to be added. This project is configured to allow a flexible development environment for developing in kubernetes and allow for the environment to be destroyed and recreated quickly and easily.

It is not meant for any production workloads.
