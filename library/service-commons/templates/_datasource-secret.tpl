{{- define "service-commons.datasource-secret" -}}
apiVersion: v1
kind: Secret
metadata:
  name: {{ .Chart.Name }}-datasource-secret
  labels:
    app: {{ .Chart.Name }}
type: Opaque
data:
  DataSource__ConnectionString: "Server={{ .Values.datasource.server }};Port={{ .Values.datasource.port }};Uid={{ .Values.datasource.username }};Pwd={{ .Values.datasource.password }};"
  DataSource__Database: {{ .Values.datasource.database }}
{{- end }}