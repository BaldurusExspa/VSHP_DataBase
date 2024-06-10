CREATE VIEW ChannelStatistics AS
SELECT
    channels.id AS channel_id,
    channels.name AS channel_name,
    channels.create_date,
    COUNT(DISTINCT videos.id) AS total_videos,
    COUNT(DISTINCT comments.id) AS total_comments,
    COUNT(DISTINCT likes.id) AS total_likes
FROM
    channels
    LEFT JOIN videos ON channels.id = videos.channels_id
    LEFT JOIN comments ON channels.id = comments.channels_id
    LEFT JOIN likes ON channels.id = likes.channels_id
GROUP BY
    channels.id, channels.name, channels.create_date;