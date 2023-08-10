{{/*
Expand the name of the chart.
*/}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "helm-chart-yaml.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "helm-chart-yaml.labels" -}}
helm.sh/chart: {{ include "helm-chart-yaml.chart" . }}
{{ include "helm-chart-yaml.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "helm-chart-yaml.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.prefix }}
app.kubernetes.io/instance: {{ .Release.Name }}
release: {{ .Release.Name }}
{{- end }}
