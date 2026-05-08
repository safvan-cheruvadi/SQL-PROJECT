DELIMITER $$


CREATE PROCEDURE GenderWiseDiseaseReport(IN p_diseaseID INT)
BEGIN
    DECLARE v_diseaseName VARCHAR(100);
    DECLARE v_maleCount INT DEFAULT 0;
    DECLARE v_femaleCount INT DEFAULT 0;
    DECLARE v_moreGender VARCHAR(10);

    -- Get disease name
    SELECT diseaseName
    INTO v_diseaseName
    FROM Disease
    WHERE diseaseID = p_diseaseID;

    -- Count MALE patients treated for the disease
    SELECT COUNT(DISTINCT pa.patientID)
    INTO v_maleCount
    FROM Treatment t
    JOIN Patient pa ON t.patientID = pa.patientID
    JOIN Person pe ON pa.patientID = pe.personID -- for connecting gender 
    WHERE t.diseaseID = p_diseaseID
      AND LOWER(pe.gender) = 'male';

    -- Count FEMALE patients treated for the disease
    SELECT COUNT(DISTINCT pa.patientID)
    INTO v_femaleCount
    FROM Treatment t
    JOIN Patient pa ON t.patientID = pa.patientID
    JOIN Person pe ON pa.patientID = pe.personID  -- LINK patient to person were gender exist
    WHERE t.diseaseID = p_diseaseID
      AND LOWER(pe.gender) = 'female';

    -- Decide which gender was treated more
    IF v_maleCount > v_femaleCount THEN
        SET v_moreGender = 'male';
    ELSEIF v_femaleCount > v_maleCount THEN
        SET v_moreGender = 'female';
    ELSE
        SET v_moreGender = 'same';
    END IF;

    -- Final output
    SELECT
        v_diseaseName AS disease_name,
        v_maleCount AS number_of_male_treated,
        v_femaleCount AS number_of_female_treated,
        v_moreGender AS more_treated_gender;

END$$

DELIMITER ;
CALL GenderWiseDiseaseReport(14);

