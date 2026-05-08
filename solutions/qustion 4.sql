WITH PatientCategory AS (   -- common table expression 
    SELECT
        d.diseaseID,
        d.diseaseName,
        CASE -- check gender+dob and assign 
            WHEN pe.gender = 'male' AND pa.dob >= '2005-01-01'
                THEN 'YoungMale'
            WHEN pe.gender = 'female' AND pa.dob >= '2005-01-01'
                THEN 'YoungFemale'

            WHEN pe.gender = 'male'
                 AND pa.dob < '2005-01-01'
                 AND pa.dob >= '1985-01-01'
                THEN 'AdultMale'
            WHEN pe.gender = 'female'
                 AND pa.dob < '2005-01-01'
                 AND pa.dob >= '1985-01-01'
                THEN 'AdultFemale'

            WHEN pe.gender = 'male'
                 AND pa.dob < '1985-01-01'
                 AND pa.dob >= '1970-01-01'
                THEN 'MidAgeMale'
            WHEN pe.gender = 'female'
                 AND pa.dob < '1985-01-01'
                 AND pa.dob >= '1970-01-01'
                THEN 'MidAgeFemale'

            WHEN pe.gender = 'male' AND pa.dob < '1970-01-01'
                THEN 'ElderMale'
            WHEN pe.gender = 'female' AND pa.dob < '1970-01-01'
                THEN 'ElderFemale'
        END AS patient_category
    FROM Treatment t
    JOIN Disease d ON t.diseaseID = d.diseaseID
    JOIN Patient pa ON t.patientID = pa.patientID
    JOIN Person pe ON pa.patientID = pe.personID
),

CategoryCount AS (
    SELECT
        diseaseID,
        diseaseName,
        patient_category,
        COUNT(*) AS category_count
    FROM PatientCategory
    GROUP BY diseaseID, diseaseName, patient_category
),

RankedCategory AS (
    SELECT *,
           DENSE_RANK() OVER ( -- for actual rank 
               PARTITION BY diseaseID -- seperation
               ORDER BY category_count DESC
           ) AS rnk
    FROM CategoryCount
)

SELECT
    diseaseName,
    patient_category AS most_affected_category,
    category_count AS number_of_patients
FROM RankedCategory
WHERE rnk = 1
ORDER BY diseaseName;
