# SQL & Power BI – IT SLA & Operations Analytics

## 🔍 TL;DR (Recruiter Summary)
End-to-end **SQL + Power BI analytics project** analyzing IT ticket lifecycle data to identify **SLA breaches, operational bottlenecks, and team capacity issues**.  
Analysis is process-driven, time-based, and focused on **actionable operational decisions**.

---

## 📌 Business Problem
Despite defined processes and priority rules, IT organizations frequently miss SLAs.  
The root causes are often unclear due to:
- Dependency-driven waiting stages
- Uneven workload distribution across teams
- Limited visibility into stage-level delays
- Priority rules not consistently enforced during execution

**Key question addressed:**
> *Where exactly does time get lost in IT ticket workflows, and what changes would have the highest impact on SLA performance?*

---

## 🧠 Analytical Approach (Thinking Like a Data Analyst)

The project follows a structured reasoning flow:

1. Model the **entire ticket lifecycle as a process**, not isolated events  
2. Measure **time spent at each stage**, not just ticket volume  
3. Define delays objectively using **stage-wise SLA thresholds**  
4. Separate **systemic bottlenecks** from extreme outliers  
5. Evaluate team performance in the context of **workload and capacity**  
6. Translate findings into **prioritized operational recommendations**

---

## 🗂 Data Model Overview
Event-based schema inspired by Jira / ServiceNow systems:

- **Tickets** – priority, category, customer type  
- **Ticket Events** – stage transitions with entered/exited timestamps  
- **Teams** – ownership and capacity  
- **SLA Rules** – stage-specific time limits  

This structure enables **handoff analysis, duration calculation, and SLA evaluation** at scale.

---

## 🔬 Analysis & Quantitative Findings (SQL-Driven)

### 1️⃣ Process Visibility
- Analyzed **1,200+ tickets** across **6,000+ lifecycle events**
- Average end-to-end resolution time: **~38–42 hours**
- Over **95% of tickets** pass through at least three distinct stages

**Insight:** Delays are cumulative across stages, not isolated to a single handoff.

---

### 2️⃣ Bottleneck Identification
- The **Waiting stage alone accounts for ~40–45% of total resolution time**
- Median waiting time remains high, confirming a **systemic bottleneck**
- Top **20% of tickets contribute ~65–70% of total delay**

**Insight:** Most delays are structural and dependency-driven, not caused by rare extreme cases.

---

### 3️⃣ SLA Breach Analysis
- Overall SLA breach rate observed: **~22–28%**
- Waiting and In-Progress stages show the **highest breach percentages**
- **High-priority tickets still breach SLAs ~18–22% of the time**
- ~15% of tickets violate SLAs **more than once**, indicating repeat risk

**Insight:** Priority classification exists at intake but is not consistently enforced during execution.

---

### 4️⃣ Team & Capacity Analysis
- Workload across teams is uneven, with the top 2 teams handling **~50% of total events**
- Some teams exhibit **high SLA breach rates despite moderate workload**
- Teams operating above **120% capacity utilization** show the highest breach frequency

**Insight:** SLA failures stem from both **capacity constraints** and **process inefficiencies**, depending on the team.

---

## 📊 Power BI Dashboard
Insights are presented through a 3-page interactive dashboard:

1. **Executive Overview**  
   High-level visibility into volume, resolution speed, SLA risk, and dependency impact

2. **SLA & Bottleneck Deep Dive**  
   Stage-level diagnostics, priority validation, and high-risk ticket identification

3. **Team & Capacity Analysis**  
   Workload distribution, breach rate comparison, and capacity utilization assessment

---

## 💡 Key Takeaways
- Nearly **half of total resolution time** is lost in dependency-driven waiting
- SLA breaches are **more process-driven than people-driven**
- A small subset of tickets creates **disproportionate operational risk**
- Priority rules are **not reliably protecting urgent tickets**
- Capacity imbalance amplifies SLA failures but is not the only root cause

---

## 🚀 Recommendations
- Reduce dependency-related waiting through clearer ownership and escalation rules  
- Auto-escalate repeat SLA violators instead of treating all tickets equally  
- Rebalance workload across teams before increasing headcount  
- Enforce priority rules consistently throughout the ticket lifecycle  

---

## 🛠 Tools & Skills Demonstrated
- SQL (CTEs, window functions, time-based analysis)
- PostgreSQL
- Power BI (DAX, interactive dashboards)
- Operations & process analytics
- SLA governance and performance monitoring

---

## 👤 Author
**Shreya Sabale**  
Aspiring Data Analyst | SQL • Power BI • Business Analytics 

