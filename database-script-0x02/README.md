# Airbnb Database Seeding Script

## Objective
Populate the Airbnb-style database with **sample data** for demonstration.

**Directory:** `database-script-0x02`  

### Files
- `seed.sql` — Contains `INSERT` statements to populate all entities.  
- `README.md` — Documentation for data insertion process and structure.

---

## Instructions

1. **Ensure your database schema exists**
   - The schema should be created from `database-script-0x01/schema.sql` before running this seed file.

2. **Run the seeding script**
   ```bash
   psql -U <username> -d <database_name> -f seed.sql
