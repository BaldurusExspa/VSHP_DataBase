# Video Hosting Data Base
Database for video hosting taking into account user, channel, videos and playlists

![image](https://github.com/BaldurusExspa/VSHP_DataBase/blob/main/Screenshot.png)

## Typical queries
**1. Select comments and dates from "Channel 2"**
```sql
SELECT comments.create_date, comments.comment
FROM comments
JOIN channels ON comments.channels_id = channels.id
WHERE channels.name LIKE 'Channel 2';
```
**2. Select playlist name and number of videos from "Channel 1" where availability equels "public"**
``` sql
SELECT playlists.name, COUNT(videos_has_playlists.videos_id) AS videos
FROM playlists
JOIN videos_has_playlists ON videos_has_playlists.playlists_id = playlists.id
JOIN channels ON playlists.channels_id = channels.id
WHERE channels.name LIKE 'Channel 1' and playlists.availability = 'public'
GROUP BY playlists.name;
```
**3. Select number of users created on 2023 year**
```sql
SELECT COUNT(users.id) AS 'Users'
FROM users
WHERE users.created_datе <= '2023-01-01';
```
**4. Select likes from all channels and order by most likes**
```sql
SELECT channels.name, COUNT(likes.id) AS 'Video_likes'
FROM likes
JOIN channels ON likes.channels_id = channels.id
JOIN videos ON likes.videos_id = videos.id
GROUP BY channels.name
ORDER BY 'Video_likes' ASC;
```
**5. Select username who created the channel**
```sql
SELECT users.username, channels.name
FROM users
JOIN channels ON channels.users_id = users.id
WHERE channels.id > 0 || channels.id != 0;
```
