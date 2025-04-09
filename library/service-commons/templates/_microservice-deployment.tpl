{{- define "service-commons.microservice-deployment" -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Chart.Name }}
  labels:
    app: {{ .Chart.Name }}
spec:
  replicas: {{ .Values.scaling.replicaCount }}
  selector:
    matchLabels:
      app: {{ .Chart.Name }}
  template:
    metadata:
      labels:
        app: {{ .Chart.Name }}
    spec:
      {{- if .Values.image.pullSecretEnabled }}
      imagePullSecrets:
        - name: "{{ .Chart.Name }}-pull-secret"
      {{- end }}
      restartPolicy: {{ .Values.container.restartPolicy }}
      containers:
        - name: {{ .Chart.Name }}
          image: "{{ .Values.image.registry.name }}/{{ .Values.image.repository }}/{{ .Values.image.name | default .Chart.Name }}:{{ required "Tag is required" .Values.image.tag }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
            {{- range .Values.container.ports }}
            - name: {{ .name }}
              containerPort: {{ .containerPort }}
              {{- if .protocol }}
              protocol: {{ .protocol }}
              {{- end }}
            {{- end }}
          env:
            {{- if and .Values.microservice.discovery .Values.microservice.discovery.enabled }}
            - configMapRef:
                name: {{ .Chart.Name }}-microservice-discovery-configmap
            {{- end }}
            {{- if and .Values.microservice.apiDiscovery .Values.microservice.apiDiscovery.enabled }}
            - configMapRef:
                name: {{ .Chart.Name }}-microservice-api-discovery-configmap
            {{- end }}
            {{- if and .Values.microservice.apiAuth .Values.microservice.apiAuth.enabled }}
            - configMapRef:
                name: {{ .Chart.Name }}-microservice-api-auth-configmap
            {{- end }}
            {{- if and .Values.microservice.apiClient .Values.microservice.apiClient.enabled }}
            - secretRef:
                name: {{ .Chart.Name }}-microservice-api-client-secret
            {{- end }}
            {{- if and .Values.microservice.mailing .Values.microservice.mailing.enabled }}
            - configMapRef:
                name: {{ .Chart.Name }}-microservice-mailing-configmap
            {{- end }}
            {{- if and .Values.microservice.datasource .Values.microservice.datasource.enabled }}
            - secretRef:
                name: {{ .Chart.Name }}-microservice-datasource-secret
            {{- end }}
            {{- range .Values.extraEnvs }}
            {{- $envName := .name -}}
            {{- if .prefixed -}}
              {{- $envName = printf "%s-%s" $.Chart.Name .name -}}
            {{- end -}}
            {{- if eq .type "secret" }}
            - secretRef:
                name: {{ $envName }}
            {{- else if eq .type "configmap" }}
            - configMapRef:
                name: {{ $envName }}
            {{- end }}
            {{- end }}
{{- end }}
