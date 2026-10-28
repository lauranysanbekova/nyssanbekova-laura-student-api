# Nyssanbekova Laura Student API

**Student:** Laura Nyssanbekova  
**GitHub username:** `lauranysanbekova`  
**Repository:** `nyssanbekova-laura-student-api`  
**Docker image:** `nyssanbekova-laura-student-api:v1.0-laura`  
**Jenkins job:** `Nyssanbekova_Laura_Student_API`

A personalized Spring Boot REST CRUD API for student records, using PostgreSQL, Docker Compose, Git, and Jenkins CI.

## API endpoints

Base URL: `http://localhost:8080`

| Method | Endpoint | Purpose |
|---|---|---|
| GET | `/api/students` | List all students |
| GET | `/api/students/{id}` | Get one student |
| POST | `/api/students` | Create a student |
| PUT | `/api/students/{id}` | Update a student |
| DELETE | `/api/students/{id}` | Delete a student |
| GET | `/api/students/about` | Display the student's name |

## Run with Docker Compose

1. Copy `.env.example` to `.env` and set a local password. Never commit `.env`.
2. Build and start services:

   ```bash
   docker compose -p nyssanbekova-laura-student-api up --build -d
   docker compose -p nyssanbekova-laura-student-api ps
   docker compose -p nyssanbekova-laura-student-api logs app
   ```

3. Test the API at `http://localhost:8080/api/students`.

## Example CRUD requests

Create:
```bash
curl -i -X POST http://localhost:8080/api/students \
  -H 'Content-Type: application/json' \
  -d '{"name":"Laura Nyssanbekova","email":"laura.nyssanbekova@example.com","groupName":"DevOps Midterm"}'
```

List:
```bash
curl -i http://localhost:8080/api/students
```

Get ID 1:
```bash
curl -i http://localhost:8080/api/students/1
```

Update ID 1:
```bash
curl -i -X PUT http://localhost:8080/api/students/1 \
  -H 'Content-Type: application/json' \
  -d '{"name":"Laura Nyssanbekova Updated","email":"laura.updated@example.com","groupName":"DevOps Midterm"}'
```

Delete ID 1:
```bash
curl -i -X DELETE http://localhost:8080/api/students/1
```

Nonexistent ID:
```bash
curl -i http://localhost:8080/api/students/999999
```
Expected response for a missing student: `404 Not Found`.

## Linux report

```bash
mkdir -p logs backups scripts src
touch logs/Nyssanbekova_Laura_system_report.log
chmod 755 scripts/Nyssanbekova_Laura_system_report.sh
./scripts/Nyssanbekova_Laura_system_report.sh
chmod 744 scripts/Nyssanbekova_Laura_system_report.sh
cp README.md backups/README_Nyssanbekova_Laura_backup.md
ls -l scripts logs backups
```

`744` means owner has read/write/execute; group and others have read-only access. The script appends output to the log with `>>`-style behavior via `tee -a`.

## Git individualization workflow

Initialize the repository and use your actual GitHub account:

```bash
git init -b main
git config user.name "Laura Nyssanbekova"
git config user.email "YOUR_GITHUB_VERIFIED_EMAIL"
git add .
git commit -m "Initial commit: Laura Nyssanbekova Student API"
git branch feature/nyssanbekova-laura-crud
git switch feature/nyssanbekova-laura-crud
```

Make a meaningful API/README change and commit it. Make a second meaningful change and commit it. Merge the branch:

```bash
git add .
git commit -m "Add personalized student CRUD API"
git switch main
git merge --no-ff feature/nyssanbekova-laura-crud
```

For the conflict exercise, create a documentation branch, edit the same README line on both branches, and merge them. Example sequence:

```bash
git switch main
git switch -c feature/nyssanbekova-laura-documentation
# Edit the project description line in README.md and commit it.
git add README.md
git commit -m "Document Laura Nyssanbekova API project"
git switch main
# Change that exact same description line on main and commit it.
git add README.md
git commit -m "Update personalized project summary"
git merge feature/nyssanbekova-laura-documentation
# If Git reports a conflict, edit README.md and remove <<<<<<<, =======, >>>>>>> markers.
git add README.md
git commit -m "Resolve README documentation conflict for Laura Nyssanbekova"
git log --oneline --graph --decorate --all
```

Create a GitHub repository named `nyssanbekova-laura-student-api` under `lauranysanbekova`, then connect and push:

```bash
git remote add origin https://github.com/lauranysanbekova/nyssanbekova-laura-student-api.git
git push -u origin main
git push -u origin feature/nyssanbekova-laura-crud
git push -u origin feature/nyssanbekova-laura-documentation
git tag v1.0-laura
git push origin v1.0-laura
git remote -v
git branch -a
git tag
```

If the GitHub repository already contains a README, either create it empty or reconcile the remote history before pushing.

## Jenkins

Create a Pipeline job named `Nyssanbekova_Laura_Student_API`, configure its source to this GitHub repository, and ensure the agent has Java 21, Gradle 8.x, Docker CLI, and permission to access the Docker daemon. The supplied `Jenkinsfile` runs Checkout, Build, Test, Docker Build, and Verify stages.

For the required controlled failure demonstration, use a temporary personal test branch: introduce a deliberate failing assertion, push it, run the job and capture the failure, then revert/fix the test and rerun. Do not leave the failure in `main`.

Configure a GitHub webhook only if the Jenkins instance is reachable by GitHub; otherwise use Poll SCM and demonstrate a new commit triggering a build. Store secrets in Jenkins Credentials, never in the repository.

## Submission evidence checklist

- [ ] Terminal output showing project tree and all required files
- [ ] Script source, generated system report log, `ls -l` permissions
- [ ] Named README backup and proof of its contents
- [ ] Process list, last five log lines, surname search saved to `Nyssanbekova_Laura_log_analysis.txt`
- [ ] GitHub repository, at least three meaningful commits, branch merge and conflict resolution
- [ ] Docker image inspection, Compose containers, logs, `exec`, stop/restart and persistence proof
- [ ] Postman/curl evidence for all CRUD operations and missing ID
- [ ] Jenkins successful run, controlled failed run, fixed successful rerun, build history and console log

## Notes

- Never commit passwords, API keys, or `.env`; use `.env.example` with placeholders.
- The application connects to PostgreSQL at hostname `postgres` inside the Compose network, not `localhost`.
- The Compose volume `nyssanbekova-laura-postgres-data` preserves database data when containers restart or are recreated.
- For Jenkins, the pipeline uses the system `gradle` command. If your instructor specifically requires the Gradle Wrapper, generate and commit it with `gradle wrapper --gradle-version 8.13`, then replace `gradle --no-daemon` with `./gradlew --no-daemon` in the Jenkinsfile and verify the wrapper works on your machine.
