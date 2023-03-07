// {
//     "data": {
//         "id": "faab0e4",
//         "body": "This meme implies that we aren’t already allies with r/lotrmemes. If it weren’t for them we would’ve lost the great meme wars.",
//         "created_utc": "2019-12-09T15:45:18",
//         "author": {
//             "id": "fdqaa",
//             "name": "suckit5253",
//             "created_utc": "2014-02-21T13:19:49",
//             "icon_img": "https://www.redditstatic.com/avatars/avatar_default_15_DDBD37.png",
//             "comment_karma": "88502",
//             "link_karma": "60633"
//         },
//         "score": "1466",
//         "permalink": "/r/PrequelMemes/comments/e8a0c7/reddit_assemble/faab0e4/",
//         "link_id": "t3_e8a0c7",
//         "parent_id": "t3_e8a0c7",
//         "submission": {
//             "id": "e8a0c7",
//             "name": "t3_e8a0c7",
//             "title": "Reddit assemble",
//             "created_utc": "2019-12-09T13:33:35",
//             "author_name": "starwarsgeek1985",
//             "num_comments": "455",
//             "score": "39006",
//             "url": "https://i.redd.it/kz7ku53k1m341.jpg"
//         },
//         "subreddit": {
//             "id": "3i60n",
//             "name": "t5_3i60n",
//             "display_name": "PrequelMemes",
//             "public_description": "Memes of the Star Wars Prequels",
//             "created_utc": "2016-12-27T03:05:47",
//             "subscribers": "1120894"
//         },
//         "has_replies": "true",
//         "is_submitter": "false",
//         "distinguished": "null",
//         "edited": "false",
//         "stickied": "false"
//     }
// }

public class RedditToSalesforce {
    
    public Data data;

    public class Data {
        public String id;
        public String body;
        public String created_utc;
        public Author author;
        public String score;
        public String permalink;
        public String link_id;
        public String parent_id;
        public Submission submission;
        public Subreddit subreddit;
        public String has_replies;
        public String is_submitter;
        public String distinguished;
        public String edited;
        public String stickied;
    }

    public class Author {
        public String id;
        public String name;
        public String created_utc;
        public String icon_img;
        public String comment_karma;
        public String link_karma;
    }

    public class Submission {
        public String id;
        public String name;
        public String title;
        public String created_utc;
        public String author_name;
        public String num_comments;
        public String score;
        public String url;
    }

    public class Subreddit {
        public String id;
        public String name;
        public String display_name;
        public String public_description;
        public String created_utc;
        public String subscribers;
    }
}