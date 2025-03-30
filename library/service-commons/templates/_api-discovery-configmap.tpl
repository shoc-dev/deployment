{{- define "service-commons.api-discovery-configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: "{{ .Chart.Name }}-api-discovery-configmap"
data:
  Self__ExternalBaseAddress: "https://{{ .Values.addresses.api }}/{{ .Chart.Name }}/"
{{- end }}
