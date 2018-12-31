I haven't used prometheus before, i tried this as best i can as below.

excerise-1 : This is done using GCP and static IP is configured for the same in kubernetes loadbalancer.

exercise-2: This is done using ansible playbook in AWS.

### HOW TO DO ###
exercise-1:

please follow the below steps, once docker image is pushed to GCR registry.
```
`gcloud container clusters create mbex1`

Creating cluster mbex1 in us-central1-b...done.
Created [https://container.googleapis.com/v1/projects/ktestdec/zones/us-central1-b/clusters/mbex1].
To inspect the contents of your cluster, go to: https://console.cloud.google.com/kubernetes/workload_/gcloud/us-central1-b/mbex1?project=ktestdec
kubeconfig entry generated for mbex1.
NAME   LOCATION       MASTER_VERSION  MASTER_IP      MACHINE_TYPE   NODE_VERSION  NUM_NODES  STATUS
mbex1  us-central1-b  1.10.9-gke.5    35.202.91.240  n1-standard-1  1.10.9-gke.5  3          RUNNING


`gcloud compute addresses create mb-ip --region us-central1`
Created [https://www.googleapis.com/compute/v1/projects/ktestdec/regions/us-central1/addresses/mb-ip].

`gcloud compute addresses describe mb-ip --region us-central1`
address: 104.198.185.30
creationTimestamp: '2018-12-29T03:31:33.371-08:00'
description: ''
id: '1403239120000181754'
kind: compute#address
name: mb-ip
networkTier: PREMIUM
region: https://www.googleapis.com/compute/v1/projects/ktestdec/regions/us-central1
selfLink: https://www.googleapis.com/compute/v1/projects/ktestdec/regions/us-central1/addresses/mb-ip
status: RESERVED

`kubectl apply -f mb-deployment.yml`
`kubectl apply -f mb-service.yml`
service/mbweb created
`kubectl get service`
NAME         TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
kubernetes   ClusterIP      10.47.240.1     <none>        443/TCP        7m
mbweb        LoadBalancer   10.47.249.117   <pending>     80:32557/TCP   6s
```

Exercise-2:

Run the ansible-playbook as below
```
`ansible-playbook deploy.yml`

TASK [final message] *******************************************************************************************************************************************************************************************
ok: [35.153.126.58] => {
    "msg": "connect to http://35.153.126.58:9090/graph & http://35.153.126.58:9090/metrics for metrics and http://35.153.126.58:9100 for node_exporter"
}
```
Note: Promethemus 2.6 is installed, but http_total_request works perfectly with 2.2 version.

