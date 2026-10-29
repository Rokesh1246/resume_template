# Rokesh Govindaraj - AI-Assisted Resume Tailoring Pipeline

This repository contains the source files, master content, LaTeX templates, and workflow for generating tailored, ATS-friendly resumes customized to specific Job Descriptions (JDs) using AI.

---

## 📁 Repository Structure

```text
rokesh-resume/
├── jd/                      # Drop target Job Descriptions here (e.g., jd/globaldigitaz.md)
├── temp/                    # Output directory for newly generated resumes (e.g., temp/Rokesh_Resume_<Company>.tex)
├── rokesh-resume-content.md # Comprehensive master profile: projects, metrics, detailed experience, and skills
├── Rokesh_Resume_2026.md    # Reference baseline resume for current roles and structure
├── Rokesh_Govindaraj_Resume.tex # Master LaTeX resume template (Jake's Resume style, ATS-optimized)
├── tracker/                 # Application tracker and job status logs (e.g., tracker/apply-tracker.md)
└── README.md                # Project documentation and workflow guide
```

---

## 🎯 Purpose & Workflow

The goal of this project is to quickly adapt Rokesh's resume for specific roles by aligning technical keywords with the target JD **without altering core facts or truthfulness**.

### 1. Add the Job Description
Save the JD text as a markdown or text file under the `jd/` directory:
- Example: `jd/company_name.md` or `jd/flutter_developer.md`

### 2. Instruct the AI
Prompt the AI agent with the target JD file name. The AI follows this exact workflow:

1. **Analyze Job Description (`jd/<target>.md`)**:
   - Extract key technical requirements, state management preferences, tooling, and responsibilities.
2. **Consult Knowledge Sources**:
   - Reference [Rokesh_Resume_2026.md](Rokesh_Resume_2026.md) for the active resume structure and baseline content.
   - Reference [rokesh-resume-content.md](rokesh-resume-content.md) to pull relevant project details, achievements, numbers, and experience points.
3. **Smart Keyword Adaptation (Without Changing Core Facts)**:
   - Match JD terminology using equivalent skills Rokesh has experience with.
   - *Example:* If the JD highlights **Provider, GetX, or Bloc**, emphasize the requested state management tool in the relevant project bullet points.
   - *Example:* Emphasize relevant backend (Firebase, Node.js), API, payment gateways (Cashfree, Apple IAP), or architectural patterns as highlighted by the JD.
   - Ensure experiences, roles, and core facts remain accurate and truthful.
4. **Generate Tailored LaTeX Resume**:
   - Use the structure and formatting of [Rokesh_Govindaraj_Resume.tex](Rokesh_Govindaraj_Resume.tex).
   - Generate the resulting file inside the `temp/` folder:
     - Example: `temp/Rokesh_Resume_<Company>.tex`

---

## 🤖 Prompt Template for AI

When asking the AI to tailor a resume, you can use:

> *"Please tailor my resume for the job description in `jd/<company_name>.md`. Refer to `Rokesh_Resume_2026.md` for my current resume structure, use `rokesh-resume-content.md` for deeper details/metrics, and adapt keywords (such as state management libraries, architecture, or tools) to match the JD without changing core facts. Keep the resume strictly to exactly 1 page (10pt, well-filled with optimal content density, no empty gaps). Use `Rokesh_Govindaraj_Resume.tex` as the template and save the new tailored resume in `temp/Rokesh_Resume_<company_name>.tex`."*

---

## 📜 AI Modification Guidelines

When tailoring a resume, the AI must adhere to the following rules:

1. **Truthfulness**: Never fabricate companies, job titles, education, or employment dates.
2. **Equivalent Substitutions**: Adapt equivalent tech stack keywords to match JD phrasing (e.g., Provider ↔ GetX / Bloc, REST ↔ Dio / HTTP, clean architecture patterns).
3. **Keyword Density**: Seamlessly incorporate JD keywords into skills list and project bullet points for optimal ATS parsing.
4. **Strict 1-Page Constraint & Optimal Space Utilization**:
   - The resume must fit **strictly on exactly 1 page** (no spillover onto page 2).
   - Use the standard **`10pt`** document class (`\documentclass[letterpaper,10pt]{article}`).
   - **No Empty / Sparse White Space**: The page must look complete, rich, and well-balanced. Ensure high information density with impactful bullet points and keywords from `rokesh-resume-content.md` that fill the single page edge-to-edge.
5. **Plain-Text Cover Letters for Web Forms**:
   - When generating cover letters, always provide them in clean **Plain Text** (no markdown bolding `**`, headers `#`, or bracketed links `[text](url)`). Write out raw URLs and standard numbering/spacing so the text can be pasted directly into portal form fields without looking broken.
6. **Output Isolation**: Never overwrite the root template `Rokesh_Govindaraj_Resume.tex`. Always write generated resumes into the `temp/` folder.

---

## 🛠️ Compiling to PDF

To compile the generated `.tex` file:

```bash
./compile_resume.sh
```

Or using `tectonic`:
```bash
tectonic -o pdf Rokesh_Govindaraj_Resume.tex
```
