{{- define "service-commons.microservice-mailing-configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: "{{ .Chart.Name }}-microservice-mailing-configmap"
data:
  Mailing__DefaultProfile: {{ .Values.microservice.mailing.defaultProfile }}
{{- end }}
