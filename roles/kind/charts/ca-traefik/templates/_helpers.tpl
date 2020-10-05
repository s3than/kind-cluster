{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "ca-traefik.name" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ca-traefik.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ca-traefik.Version" -}}
{{- .Chart.Version -}}
{{- end -}}

{{/*
Override App version
*/}}
{{- define "ca-traefik.OverrideVersion" -}}
  {{- .Chart.AppVersion | trunc 63 | trimSuffix "-" | quote -}}
{{- end -}}

{{/*
Override App version
*/}}
{{- define "ca-traefik.AppVersion" -}}
  {{- .Chart.AppVersion -}}
{{- end -}}