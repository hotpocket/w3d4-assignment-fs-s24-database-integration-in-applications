INSERT INTO user (username, password) VALUES ("admin5", "$uper$ecret0MG!");
INSERT INTO user (username, password) VALUES ("user7", "$uper$ecret5auce");
INSERT INTO post (user_id, post_text) VALUES (1, "post1(admin5) - Eye NO th!ngs, truest meee!");
INSERT INTO post (user_id, post_text) VALUES (2, "post2(user7) - I'm the best!  I do stuff!");
INSERT INTO comment (post_id, user_id, comment_text) VALUES (1,2, "user7 comment on post 1 - I don't believe your lies admin5");
INSERT INTO comment (post_id, user_id, comment_text) VALUES (2,1, "admin5 comment on post 2 - You're a noob user7!");
