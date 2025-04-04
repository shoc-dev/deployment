{{- define "service-commons.api-auth-configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: "{{ .Chart.Name }}-api-auth-configmap"
data:
  Auth__Authority: "{{ .Values.auth.authority }}"
  Auth__AllowInsecure: "{{ .Values.auth.allowInsecure }}"
{{- end }}
