
include:
  - aws.boto

"Deploy S3 files":
  s3plus.exists:
    - bucket: saltme-demo
    - path: /tmp/cloud
    - files:
      - SQLEXPR_x64_ENU.zip
      - SQLEXPR_x64_ENU.zip.md5
      - SSMS-Setup-ENU.exe
      - SSMS-Setup-ENU.exe.md5