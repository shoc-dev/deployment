{{- define "service-commons.microservice-datasource-secret" -}}
apiVersion: v1
kind: Secret
metadata:
  name: {{ .Chart.Name }}-microservice-datasource-secret
  labels:
    app: {{ .Chart.Name }}
type: Opaque
stringData:
  DataSource__ConnectionString: "Server={{ .Values.microservice.datasource.server }};Port={{ .Values.microservice.datasource.port }};Uid={{ .Values.microservice.datasource.username }};Pwd={{ .Values.microservice.datasource.password }};"
  DataSource__Database: {{ .Values.microservice.datasource.database }}
{{- end }}