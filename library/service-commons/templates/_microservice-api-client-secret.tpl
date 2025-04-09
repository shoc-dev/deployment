{{- define "service-commons.microservice-api-client-secret" -}}
apiVersion: v1
kind: Secret
metadata:
  name: {{ .Chart.Name }}-microservice-api-client-secret
  labels:
    app: {{ .Chart.Name }}
type: Opaque
stringData:
  Client__ClientId: "{{ .Values.microservice.apiClient.clientId }}"
  Client__ClientSecret: "{{ .Values.microservice.apiClient.clientSecret }}"
{{- end }}