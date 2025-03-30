{{- define "service-commons.pull-secret" -}}
apiVersion: v1
kind: Secret
metadata:
  name: {{ .Chart.Name }}-pull-secret
  labels:
    app: {{ .Chart.Name }}
type: kubernetes.io/dockerconfigjson
data:
  .dockerconfigjson: {{ template "imagePullSecret" . }}
{{- end }}