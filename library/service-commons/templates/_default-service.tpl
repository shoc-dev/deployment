{{- define "service-commons.default-service" -}}
apiVersion: v1
kind: Service

metadata:
  name: {{ .Chart.Name }}
  labels: 
    name: {{ .Chart.Name }}
 
spec:
  type: ClusterIP
  
  selector:
    app: {{ .Chart.Name }}

  clusterIP: None
  
  ports:
    {{- range .Values.service.ports }}
    - name: {{ .name }}
      port: {{ .port }}
      {{- if .targetPort }}
      targetPort: {{ .targetPort }}
      {{- end }}
      {{- if .protocol }}
      protocol: {{ .protocol }}
      {{- end }}
      {{- if .nodePort }}
      nodePort: {{ .nodePort }}
      {{- end }}
    {{- end }}
{{- end }}
