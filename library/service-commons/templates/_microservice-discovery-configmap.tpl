{{- define "service-commons.microservice-discovery-configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: "{{ .Chart.Name }}-microservice-discovery-configmap"
data:
  Discovery__Type: {{ .Values.microservice.discovery.type }}
  StaticDiscovery__HostingType: {{ .Values.microservice.discovery.static.hostingType }}
  StaticDiscovery__DefaultProtocol: {{ .Values.microservice.discovery.static.defaultProtocol }}
  StaticDiscovery__DefaultGrpcProtocol: {{ .Values.microservice.discovery.static.defaultGrpcProtocol }}
{{- end }}
