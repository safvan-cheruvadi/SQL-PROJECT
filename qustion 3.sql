
 (   SELECT 
        ip.planName AS insurance_plan_name,
        ic.companyName AS insurance_company_name,
        'most claimed' AS plan_claim_type
    FROM Claim c
    JOIN InsurancePlan ip ON c.uin = ip.uin
    JOIN InsuranceCompany ic ON ip.companyID = ic.companyID
    GROUP BY ip.uin, ip.planName, ic.companyName
    ORDER BY COUNT(c.claimID) DESC
    LIMIT 3)

UNION ALL

(    SELECT 
        ip.planName AS insurance_plan_name,
        ic.companyName AS insurance_company_name,
        'least claimed' AS plan_claim_type
    FROM Claim c
    JOIN InsurancePlan ip ON c.uin = ip.uin
    JOIN InsuranceCompany ic ON ip.companyID = ic.companyID
    GROUP BY ip.uin, ip.planName, ic.companyName
    ORDER BY COUNT(c.claimID) ASC
    LIMIT 3
);
