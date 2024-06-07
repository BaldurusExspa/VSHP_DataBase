# Video Hosting Data Base
Database for video hosting taking into account user, channel, videos and playlists

![image](https://github.com/BaldurusExspa/VSHP_DataBase/blob/main/Screenshot.png)

## PROCEDURES
1. Procedure for get channels statictic
``` sql
CREATE PROCEDURE GetChannelStatistics()
BEGIN
    SELECT
        channels.id AS channel_id,
        channels.name AS channel_name,
        channels.create_date,
        COUNT(DISTINCT videos.id) AS total_videos,
        COUNT(DISTINCT comments.id) AS total_comments,
        COUNT(DISTINCT likes.id) AS total_likes
    FROM channels
    LEFT JOIN videos ON channels.id = videos.channels_id
    LEFT JOIN comments ON channels.id = comments.channels_id
    LEFT JOIN likes ON  channels.id = likes.channels_id
    GROUP BY
        channels.id,
        channels.name,
        channels.create_date;
END //
```
