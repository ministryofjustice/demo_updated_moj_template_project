apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${PROTOTYPE_NAME}-app
  namespace: ${KUBE_NAMESPACE}
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ${PROTOTYPE_NAME}-app
  template:
    metadata:
      labels:
        app: ${PROTOTYPE_NAME}-app
    spec:
      containers:
        - name: ${PROTOTYPE_NAME}-app
          image: ${ECR_URL}:${IMAGE_TAG}
          env:
            - name: USERNAME
                valueFrom:
                  secretKeyRef:
                    name: basic-auth
                    key: username
            - name: PASSWORD
                valueFrom:
                  secretKeyRef:
                    name: basic-auth
                    key: password
          ports:
            - name: http
              containerPort: 4567