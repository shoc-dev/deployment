{{/*
Create secret to access docker registry
*/}}
{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.image.registry.name (printf "%s:%s" .Values.image.registry.username .Values.image.registry.password | b64enc) | b64enc }}
{{- end }}