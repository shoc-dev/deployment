{{- define "service-commons.next-deployment" -}}
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
            {{- if and .Values.discovery .Values.discovery.enabled }}
            - configMapRef:
                name: {{ .Chart.Name }}-discovery-configmap
            {{- end }}
            {{- if and .Values.auth .Values.auth.enabled }}
            - configMapRef:
                name: {{ .Chart.Name }}-api-auth-configmap
            {{- end }}
            {{- if and .Values.apiDiscovery .Values.apiDiscovery.enabled }}
            - configMapRef:
                name: {{ .Chart.Name }}-api-discovery-configmap
            {{- end }}
            {{- if and .Values.mailing .Values.mailing.enabled }}
            - configMapRef:
                name: {{ .Chart.Name }}-mailing-configmap
            {{- end }}
            {{- if and .Values.datasource .Values.datasource.enabled }}
            - secretRef:
                name: {{ .Chart.Name }}-datasource-secret
            {{- end }}
            {{- if and .Values.apiClient .Values.apiClient.enabled }}
            - secretRef:
                name: {{ .Chart.Name }}-api-client-secret
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
