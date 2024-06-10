DELIMITER //

CREATE PROCEDURE DeleteUnwantedComments(IN unwanted_text TEXT)
BEGIN
    DECLARE rows_count INT DEFAULT 0;

    SELECT COUNT(*) INTO rows_count
    FROM comments
    WHERE comments.comment LIKE CONCAT('%', unwanted_text, '%');

    IF rows_count > 0 THEN
        START TRANSACTION;
			DELETE FROM comments
			WHERE comments.comment LIKE CONCAT('%', unwanted_text, '%');
        COMMIT;
    ELSE
        SELECT 'No unwanted comments found' AS message;
    END IF;
END //

DELIMITER ;