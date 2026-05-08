DELIMITER $$

CREATE PROCEDURE CompareDiseaseClaimsToAverage(IN p_diseaseID INT)
BEGIN -- create a variable
    DECLARE v_diseaseClaims INT DEFAULT 0; -- store the claims 
    DECLARE v_avgClaims FLOAT DEFAULT 0;
    DECLARE v_result VARCHAR(50);

    -- Count DISTINCT claims for the passed disease
    SELECT COUNT(DISTINCT t.claimID) -- count how many diffrents claims are linked to disease
    INTO v_diseaseClaims
    FROM Treatment t
    WHERE t.diseaseID = p_diseaseID  -- disease id mach input
      AND t.claimID IS NOT NULL;

    -- If NULL, make it 0
    IF v_diseaseClaims IS NULL THEN
        SET v_diseaseClaims = 0;
    END IF;

    -- Compute average claims across ALL diseases
    SELECT AVG(claimCount)
    INTO v_avgClaims
    FROM (
        SELECT d.diseaseID,
               COUNT(DISTINCT t.claimID) AS claimCount  -- for each disease find how many claims that
        FROM Disease d
        LEFT JOIN Treatment t -- attach treatment if present  otherwise still include the disease 
               ON d.diseaseID = t.diseaseID 
              AND t.claimID IS NOT NULL
        GROUP BY d.diseaseID
    ) AS x; -- name it x and avg take it from here

    -- Decide higher or lower than average
    IF v_diseaseClaims > v_avgClaims THEN
        SET v_result = 'claimed higher than average';
    ELSE
        SET v_result = 'claimed lower than average';
    END IF;

    -- Return output
    SELECT
        p_diseaseID AS diseaseID,
        v_diseaseClaims AS diseaseClaimCount,
        ROUND(v_avgClaims, 3) AS avgClaims,
        v_result AS verdict;

END$$

DELIMITER ;


CALL CompareDiseaseClaimsToAverage(4);
