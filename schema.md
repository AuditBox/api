sudo service postgresql start
./ngrok http -hostname=auditbox.ngrok.io 3000
# User
- Name
- Email
- Organization reference
- Level (Owner, Developer, Auditor)

# Organization
- Name

# Access Key
- Organization reference
- Write key
- Secrete key
- Name

# Asset
- Type
- Identifier           
- Name
- Description
- attributes json
- Organization reference
- AddedBy reference

# Tag
- key
- value
- Asset reference
- Organization reference

# Control
- handle
- name
- description
- organization reference

# MonitoredTag - Indicates that a control is expecting evidence for assets with the tag
- Control reference
- Tag reference

# Evidence Artifact
- Control reference
- Asset (optional)
- attributes json
- description




##### refactor

* Create a new model, called a scope.  Within the scope is a list of "tags" that act as a json query.
* Tags as a model are removed.  Instead we just represent arbitrary key value pairs directly on assets
* controls don't associate to tags at all.  Instead they have and belong to many scopes.
* Scopes narrow the list of assets.  Multiple scopes grow the list of assets.
* Scopes have names


#############

# Attachment
- EvidenceArtifact reference
- s3url
- resource reference


# Do these later probably

# Audit Framework
- Name

# Requirement
- Identifier
- Name
- Audit Framework reference

# ControlRequirement
- Control reference
- Requirement reference

