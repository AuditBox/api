sudo service postgresql start
ngrok http -hostname=auditbox.ngrok.io 80
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

