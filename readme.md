# TEST Cluster

## Install

This will destroy a previous kind cluster and build a new one with all features

```
ansible-playbook start-local-cluster.yml
```

This will use an existing cluster and configure
```
ansible-playbook start-local-cluster.yml -t update
```

This will use an existing cluster and configure network
```
ansible-playbook start-local-cluster.yml -t network
```

This will use an existing cluster and configure consul
```
ansible-playbook start-local-cluster.yml -t consul
```

This will use an existing cluster and configure monitoring
```
ansible-playbook start-local-cluster.yml -t monitoring
```

This will use an existing cluster and configure loadbalancer
```
ansible-playbook start-local-cluster.yml -t loadbalancer
```

This will use an existing cluster and configure traefik
```
ansible-playbook start-local-cluster.yml -t traefik
```


## Features

* Consul networking and connection to CS DNS providers ** requires VPN
* metallb loadbalancers ** see CoreDNS host config for example of DNS name routing
* Grafana and Prometheus Monitoring
* Traefik V2


CoreDNS host config this allows DNS addresses such as traefik.forwardmlb to be routed to the Metallb service.
```
       │ File: /home/tcolbert/.config/dns/CorefileExternal
───────┼────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   1   │ template IN ANY {
   2   │   match .*(forward).$
   3   │   answer "{{ .Name }} 60 IN A 127.0.0.1"
   4   │   fallthrough
   5   │ }
   6   │ template IN ANY {
   7   │   match .*(forwardmlb).$
   8   │   answer "{{ .Name }} 60 IN A 172.18.255.1"
   9   │   fallthrough
  10   │ }
```

## TODO

* bridge metallb address range to external traffic * so not a prod thing
* secrets dev secrets etc..
* use charts from cs helm charts