{{- define "service-commons.api-discovery-configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: "{{ .Chart.Name }}-api-discovery-configmap"
data:
  {{- if .Values.apiDiscovery.pathRouting }}
  Self__ExternalBaseAddress: "{{ .Values.apiDiscovery.protocol }}://{{ .Values.apiDiscovery.root }}/{{ .Chart.Name }}/"
  {{- else }}
  Self__ExternalBaseAddress: "{{ .Values.apiDiscovery.protocol }}://{{ .Values.apiDiscovery.root }}/"
  {{- end }}
{{- end }}
