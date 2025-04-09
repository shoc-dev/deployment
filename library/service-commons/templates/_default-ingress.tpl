{{- define "service-commons.default-ingress" -}}
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: "{{ .Chart.Name }}-ingress"
  annotations:
    {{- if .Values.ingress.nginx.bodySize }}
    nginx.ingress.kubernetes.io/proxy-body-size: {{ .Values.ingress.nginx.bodySize | quote }}
    {{- end }}
    {{- if .Values.ingress.clusterIssuer }}
    cert-manager.io/cluster-issuer: {{ .Values.ingress.clusterIssuer }}
    {{- end }}
spec:
  tls:
  - hosts:
    - {{ .Values.ingress.host }}
    secretName: "{{ .Chart.Name }}-tls-certificate-secret"
  rules:
  - host: {{ .Values.ingress.host }}
    http:
      paths:
      - pathType: Prefix
        path: /
        backend:
          service:
            name: {{ .Values.ingress.service }}
            port:
              name: {{ .Values.ingress.port }}  
{{- end }}
