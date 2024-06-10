DELIMITER $$

CREATE TRIGGER `DeleteBadnameChannels`
BEFORE DELETE ON `channels`
FOR EACH ROW
BEGIN
    IF OLD.name LIKE '%nigger%' OR OLD.name LIKE '%bitch%' OR OLD.name LIKE '%fuck%' THEN
        DELETE FROM videos_has_playlists
        WHERE videos_id IN (SELECT id FROM videos WHERE channels_id = OLD.id);
        DELETE FROM comments WHERE channels_id = OLD.id;
        DELETE FROM likes WHERE channels_id = OLD.id;
        DELETE FROM subscribers WHERE channels_id = OLD.id;
        DELETE FROM playlists WHERE channels_id = OLD.id;
        DELETE FROM videos WHERE channels_id = OLD.id;
    END IF;
END$$

DELIMITER ;