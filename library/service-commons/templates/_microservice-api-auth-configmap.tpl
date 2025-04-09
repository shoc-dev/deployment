{{- define "service-commons.microservice-api-auth-configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: "{{ .Chart.Name }}-microservice-api-auth-configmap"
data:
  Auth__Authority: "{{ .Values.microservice.apiAuth.authority }}"
  Auth__AllowInsecure: "{{ .Values.microservice.apiAuth.allowInsecure }}"
{{- end }}
