{{/*
Create secret to access docker registry
*/}}
{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.image.registry.name (printf "%s:%s" .Values.image.registry.username .Values.image.registry.password | b64enc) | b64enc }}
{{- end }}

{{/*
Convert an array to a semicolon-separated string
Usage: {{ include "arrayToSemicolonString" (list .Values.paths) }}
*/}}
{{- define "arrayToSemicolonString" -}}
{{- $array := index . 0 -}}
{{- $result := "" -}}
{{- range $index, $element := $array -}}
  {{- if $index -}}
    {{- $result = printf "%s;%s" $result $element -}}
  {{- else -}}
    {{- $result = $element -}}
  {{- end -}}
{{- end -}}
{{- $result -}}
{{- end -}}