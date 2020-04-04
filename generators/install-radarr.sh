 #!/bin/bash
export DIR=./descriptors/radarr
 helm template  radarr bananaspliff/radarr \
    --values $DIR/media.radarr.values.yaml \
    --namespace media >> $DIR/00-radarr.yaml