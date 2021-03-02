# TEST Cluster

This cluster is designed to allow quick prototyping of k8s.

## Variables

| Variables     | Default | Description                                 |
| ------------- | :-----: | ------------------------------------------- |
| docker_config |  True   | Inject docker config from user into cluster |
| kind_workers  |    3    | Number of Kind Worker Nodes                 |
| external_api  |  False  | Allow access to the k8s api via 0.0.0.0     |

## Features

* Calico Networking
* metallb loadbalancers
* Grafana and Prometheus Monitoring
* Traefik V2, socat proxy forwarders for metallb

## Install

This will destroy a previous kind cluster and build a new one with all features

```shell
ansible-playbook start-local-cluster.yml
```

### Minimum Clusters

Build a minimum kind cluster

```shell
ansible-playbook -t minimum start-local-cluster.yml
```

Build a minimum kind cluster with Calico networking

```shell
ansible-playbook -t network start-local-cluster.yml
```

### All Features

```shell
ansible-playbook start-local-cluster.yml
```

### Adding Features

This will expect the cluster to exist

```shell
ansible-playbook start-local-cluster.yml -t add-features
```

This will use an existing cluster and configure monitoring

```shell
ansible-playbook start-local-cluster.yml -t monitoring
```

This will use an existing cluster and configure loadbalancer

```shell
ansible-playbook start-local-cluster.yml -t loadbalancer
```

This will use an existing cluster and configure traefik

```shell
ansible-playbook start-local-cluster.yml -t traefik
```

## Todo

* Add checks for add-features that cluster exists
* Add alternative ingress, nginx
