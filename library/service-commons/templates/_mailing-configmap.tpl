{{- define "service-commons.mailing-configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: "{{ .Chart.Name }}-mailing-configmap"
data:
  Mailing__DefaultProfile: {{ .Values.mailing.defaultProfile }}
{{- end }}
