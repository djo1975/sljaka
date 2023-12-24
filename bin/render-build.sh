services:
  - type: web
    name: mysite
    runtime: ruby
    plan: free
    buildCommand: "./bin/render-build.sh"
    startCommand: "./bin/rails server -b 0.0.0.0"
    envVars:
      - key: DATABASE_URL
        fromDatabase:
          name: mysite
          property: connectionString
      - key: RAILS_MASTER_KEY
        sync: false
      - key: WEB_CONCURRENCY
        value: 2
