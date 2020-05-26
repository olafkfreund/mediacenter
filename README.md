# Media Center on Pi 4

I'm using VSCode and an devcontainer. Since I have a lot of different projects it's really easy to use container pre-build for each project.
I have attached the .devcontainer with the source files. Try it. It works great.

## Install and configure the cluster.

There are so many ways to install and configure a kubernetes cluster on Pi 4.

- K3s with Ansbile See my repo: https://github.com/olafkfreund/ansible-k3s-rpi


## Pre-Requirements if not using "ansible-k3s-rpi playbook"

- Installed k3s
- configured SSD disk and mounted on "/mnt/disk01"
- installed and configured nfs share and clients

## This repo is created for use with kustomize ( or fluxcd )

- All code is in base
    - common: namespace and ingress definition
    - media: different media services that I use on my cluster.
    - system: dashboard, cert-manager, metallb, nginx and Volumes


## If you want to use this repo.
Add system services like: nginx, metallb and Volumes.
```bash
kubectl apply -k ./system/
```
Add media services
```bash
kubectl apply -k ./base/media/
```
Add Ingress
```bash
kubectl apply -k ./base/common/
```
### Change config for Metallb

- 03-metallb-config.yaml: Change the address-pools config.

### Change the Volumes config

- persistentvolume.yaml path file to what ever You are using.

### If You are running Plex remember to change:
 Get a claim token

Obtain a Plex Claim Token by visiting plex.tv/claim. You need to create an account if you haven't already one yet.

This will be used to bind your new PMS instance to your own user account automatically.

### For Transmission over VPN create a secret. This is your NordVPN username and password:


    kubectl create secret generic openvpn \
    --from-literal username=<VPN_USERNAME> \
    --from-literal password=<VPN_PASSWORD> \
    --namespace media

### Jacket over VPN
Create a file credentials.conf into the folder /mnt/disk01/configs/jackett/openvpn/ composed of two line (first one: username and second one password)
```
<VPN_USERNAME>
<VPN_PASSWORD>
```

Create the following directory structure on your SSD

```bash
$ mkdir -p /mnt/disk01/media/configs/jackett/Jackett/
```

Create the file ServerConfig.json into the folder /mnt/disk01/media/configs/jackett/Jackett/ with the following content:

```
{
  "BasePathOverride": "/jackett"
}
```
### Sonarr

Create the following directory structure on your SSD

```bash
$ mkdir -p /mnt/disk01/media/configs/sonarr/
```

Create the file config.xml into the folder /mnt/disk01/media/configs/sonarr/ with the following content:

```
<Config>
  <UrlBase>/sonarr</UrlBase>
</Config>
```
### Radarr

Create the following directory structure on your SSD

```bash
$ mkdir -p /mnt/disk01/media/configs/radarr/
```

Create the file config.xml into the folder /mnt/disk01/media/configs/radarr/ with the following content:

```
<Config>
  <UrlBase>/radarr</UrlBase>
</Config>
```
### Bazarr

Create the following directory structure on your SSD

```bash
$ mkdir -p /mnt/disk01/media/configs/bazarr/
```

Create the file config.xml into the folder /mnt/disk01/media/configs/radarr/ with the following content:

```
<Config>
  <UrlBase>/bazarr</UrlBase>
</Config>
```

### All the media services will be installed in the "media" namespace

### If you want to generate new yaml files or make other changes use the files in the "generators" folder.