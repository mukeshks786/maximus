SELECT 
  user.`id`,
  user.`first_name`,
  user.`last_name`,
  user.`email`,
  MAX(
    CASE
      WHEN user_info_field.shortname = 'college' 
      THEN user_info_data.`data` 
      ELSE NULL 
    END
  ) college,
  MAX(
    CASE
      WHEN user_info_field.shortname = 'department' 
      THEN user_info_data.`data` 
      ELSE NULL 
    END
  ) department 
FROM
  `user` 
  JOIN user_info_data 
    ON user.`id` = user_info_data.`userid` 
  JOIN user_info_field 
    ON user_info_data.`fieldid` = user_info_field.`id` 
GROUP BY user.`id` 
