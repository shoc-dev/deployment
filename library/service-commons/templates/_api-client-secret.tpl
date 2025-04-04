{{- define "service-commons.api-client-secret" -}}
apiVersion: v1
kind: Secret
metadata:
  name: {{ .Chart.Name }}-api-client-secret
  labels:
    app: {{ .Chart.Name }}
type: Opaque
stringData:
  Client__ClientId: "{{ .Values.apiClient.clientId }}"
  Client__ClientSecret: "{{ .Values.apiClient.clientSecret }}"
{{- end }}