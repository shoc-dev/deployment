{{- define "service-commons.microservice-api-discovery-configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: "{{ .Chart.Name }}-microservice-api-discovery-configmap"
data:
  {{- if .Values.microservice.apiDiscovery.pathRouting }}
  Self__ExternalBaseAddress: "{{ .Values.microservice.apiDiscovery.protocol }}://{{ .Values.microservice.apiDiscovery.root }}/{{ .Chart.Name }}/"
  {{- else }}
  Self__ExternalBaseAddress: "{{ .Values.microservice.apiDiscovery.protocol }}://{{ .Values.microservice.apiDiscovery.root }}/"
  {{- end }}
{{- end }}
