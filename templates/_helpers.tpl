{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "microfunctions.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "microfunctions.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "microfunctions.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "microfunctions.labels" -}}
helm.sh/chart: {{ include "microfunctions.chart" . }}
{{ include "microfunctions.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "microfunctions.selectorLabels" -}}
app.kubernetes.io/name: {{ include "microfunctions.name" . }}
app.kubernetes.io/part-of: {{ include "microfunctions.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "microfunctions.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "microfunctions.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
###################################   microfunctionsapis ###################################
*/}}

{{/*
Create a fully qualified microfunctionsapis name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "microfunctions.microfunctionsapis.fullname" -}}
{{- if .Values.microfunctionsapis.fullnameOverride -}}
{{- .Values.microfunctionsapis.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.microfunctionsapis.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.microfunctionsapis.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "microfunctions.microfunctionsapis.labels" -}}
helm.sh/chart: {{ include "microfunctions.chart" . }}
{{ include "microfunctions.microfunctionsapis.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Values.microfunctionsapis.image.tag| quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "microfunctions.microfunctionsapis.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.microfunctionsapis.name  }}
app.kubernetes.io/part-of: {{ include "microfunctions.name" . }}
app.kubernetes.io/instance: {{ .Values.microfunctionsapis.name  }}
{{- end }}

{{/*
###################################   microfunctionsauth ###################################
*/}}

{{/*
Create a fully qualified microfunctionsauth name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "microfunctions.microfunctionsauth.fullname" -}}
{{- if .Values.microfunctionsauth.fullnameOverride -}}
{{- .Values.microfunctionsauth.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.microfunctionsauth.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.microfunctionsauth.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "microfunctions.microfunctionsauth.labels" -}}
helm.sh/chart: {{ include "microfunctions.chart" . }}
{{ include "microfunctions.microfunctionsauth.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Values.microfunctionsauth.image.tag| quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "microfunctions.microfunctionsauth.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.microfunctionsauth.name  }}
app.kubernetes.io/instance: {{ .Values.microfunctionsauth.name  }}
app.kubernetes.io/part-of: {{ include "microfunctions.name" . }}
{{- end }}

{{/*
###################################   microfunctionscluster ###################################
*/}}

{{/*
Create a fully qualified microfunctionscluster name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "microfunctions.microfunctionscluster.fullname" -}}
{{- if .Values.microfunctionscluster.fullnameOverride -}}
{{- .Values.microfunctionscluster.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.microfunctionscluster.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.microfunctionscluster.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "microfunctions.microfunctionscluster.labels" -}}
helm.sh/chart: {{ include "microfunctions.chart" . }}
{{ include "microfunctions.microfunctionscluster.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Values.microfunctionscluster.image.tag| quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "microfunctions.microfunctionscluster.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.microfunctionscluster.name  }}
app.kubernetes.io/instance: {{ .Values.microfunctionscluster.name  }}
app.kubernetes.io/part-of: {{ include "microfunctions.name" . }}
{{- end }}

{{/*
###################################   microfunctionsserverless ###################################
*/}}

{{/*
Create a fully qualified microfunctionsserverless name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "microfunctions.microfunctionsserverless.fullname" -}}
{{- if .Values.microfunctionsserverless.fullnameOverride -}}
{{- .Values.microfunctionsserverless.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.microfunctionsserverless.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.microfunctionsserverless.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "microfunctions.microfunctionsserverless.labels" -}}
helm.sh/chart: {{ include "microfunctions.chart" . }}
{{ include "microfunctions.microfunctionsserverless.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Values.microfunctionsserverless.image.tag| quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "microfunctions.microfunctionsserverless.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.microfunctionsserverless.name  }}
app.kubernetes.io/instance: {{ .Values.microfunctionsserverless.name  }}
app.kubernetes.io/part-of: {{ include "microfunctions.name" . }}
{{- end }}


{{/*
###################################   microfunctionsinitjob ###################################
*/}}

{{/*
Create a fully qualified microfunctionsinitjob name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "microfunctions.microfunctionsinitjob.fullname" -}}
{{- if .Values.microfunctionsinitjob.fullnameOverride -}}
{{- .Values.microfunctionsinitjob.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.microfunctionsinitjob.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.microfunctionsinitjob.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "microfunctions.microfunctionsinitjob.labels" -}}
helm.sh/chart: {{ include "microfunctions.chart" . }}
{{ include "microfunctions.microfunctionsinitjob.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Values.microfunctionsinitjob.image.tag| quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "microfunctions.microfunctionsinitjob.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.microfunctionsinitjob.name  }}
app.kubernetes.io/instance: {{ .Values.microfunctionsinitjob.name  }}
app.kubernetes.io/part-of: {{ include "microfunctions.name" . }}
{{- end }}


{{/*
###################################   microfunctionscontroller ###################################
*/}}

{{/*
Create a fully qualified microfunctionscontroller name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "microfunctions.microfunctionscontroller.fullname" -}}
{{- if .Values.microfunctionscontroller.fullnameOverride -}}
{{- .Values.microfunctionscontroller.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.microfunctionscontroller.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.microfunctionscontroller.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "microfunctions.microfunctionscontroller.labels" -}}
helm.sh/chart: {{ include "microfunctions.chart" . }}
{{ include "microfunctions.microfunctionscontroller.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Values.microfunctionscontroller.image.tag| quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "microfunctions.microfunctionscontroller.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.microfunctionscontroller.name  }}
app.kubernetes.io/instance: {{ .Values.microfunctionscontroller.name  }}
app.kubernetes.io/part-of: {{ include "microfunctions.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "microfunctions.microfunctionscontroller.serviceAccountName" -}}
{{- if .Values.microfunctionscontroller.serviceAccount.create }}
{{- default (include "microfunctions.microfunctionscontroller.fullname" .) .Values.microfunctionscontroller.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.microfunctionscontroller.serviceAccount.name }}
{{- end }}
{{- end }}



{{/*
###################################   microfunctionsconsole ###################################
*/}}

{{/*
Create a fully qualified microfunctionsconsole name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "microfunctions.microfunctionsconsole.fullname" -}}
{{- if .Values.microfunctionsconsole.fullnameOverride -}}
{{- .Values.microfunctionsconsole.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.microfunctionsconsole.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.microfunctionsconsole.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "microfunctions.microfunctionsconsole.labels" -}}
helm.sh/chart: {{ include "microfunctions.chart" . }}
{{ include "microfunctions.microfunctionsconsole.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Values.microfunctionsconsole.image.tag| quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "microfunctions.microfunctionsconsole.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.microfunctionsconsole.name  }}
app.kubernetes.io/instance: {{ .Values.microfunctionsconsole.name  }}
app.kubernetes.io/part-of: {{ include "microfunctions.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "microfunctions.microfunctionsconsole.serviceAccountName" -}}
{{- if .Values.microfunctionsconsole.serviceAccount.create }}
{{- default (include "microfunctions.microfunctionsconsole.fullname" .) .Values.microfunctionsconsole.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.microfunctionsconsole.serviceAccount.name }}
{{- end }}
{{- end }}


{/*
############################################ mongodb ###########################
*/}}
{{- define "microfunctions.mongodb.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-%s" .Values.fullnameOverride "mongodb" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name "mongodb" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}


{/*
rabbitmq
*/}}
{{- define "microfunctions.rabbitmq.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-%s" .Values.fullnameOverride "rabbitmq" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name "rabbitmq" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
