DELIMITER //

CREATE FUNCTION GetChannelStats(channel_id INT) 
RETURNS JSON
DETERMINISTIC
BEGIN
    DECLARE total_videos INT;
    DECLARE total_comments INT;
    DECLARE total_likes INT;
    DECLARE result JSON;

    SELECT COUNT(*) INTO total_videos 
    FROM videos 
    WHERE channels_id = channel_id;

    SELECT COUNT(*) INTO total_comments 
    FROM comments 
    WHERE channels_id = channel_id;

    SELECT COUNT(*) INTO total_likes 
    FROM likes 
    WHERE channels_id = channel_id;

    SET result = JSON_OBJECT(
        'total_videos', total_videos,
        'total_comments', total_comments,
        'total_likes', total_likes
    );

    RETURN result;
END //

DELIMITER ;
