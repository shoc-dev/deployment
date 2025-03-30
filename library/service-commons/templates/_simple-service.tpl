{{- define "service-commons.simple-service" -}}
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
    - protocol: TCP
      port: {{ .Values.service.port }}
      targetPort: {{ .Values.container.port }}
{{- end }}
