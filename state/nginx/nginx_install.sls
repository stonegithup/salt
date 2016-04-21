nginx:
  pkg:
    - installed
    - skip_verify: True
  service.running:
    - restart: True

