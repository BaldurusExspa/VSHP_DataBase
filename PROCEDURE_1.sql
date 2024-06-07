DELIMITER //

CREATE PROCEDURE CleanComments()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE commentId INT;
    DECLARE cur CURSOR FOR
        SELECT id FROM comments WHERE comment LIKE '%nigga%';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    START TRANSACTION;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO commentId;
        IF done THEN
            LEAVE read_loop;
        END IF;

        DELETE FROM comments WHERE id = commentId;
    END LOOP;

    CLOSE cur;

    COMMIT;
END //

DELIMITER ;