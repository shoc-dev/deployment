{{- define "service-commons.discovery-configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: "{{ .Chart.Name }}-discover-configmap"
data:
  Discovery__Type: {{ .Values.discovery.type }}
  StaticDiscovery__HostingType: {{ .Values.discovery.static.hostingType }}
  StaticDiscovery__DefaultProtocol: {{ .Values.discovery.static.defaultProtocol }}
  StaticDiscovery__DefaultGrpcProtocol: {{ .Values.discovery.static.defaultGrpcProtocol }}
{{- end }}
