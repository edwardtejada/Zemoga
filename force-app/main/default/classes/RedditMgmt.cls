@RestResource(urlMapping='/v1/RedditMgmt')
global with sharing class RedditMgmt {

    public RedditMgmt() {}

    @HttpPost 
    global static String createComment() {
        if (RestContext.request.requestBody != null) {
            RedditToSalesforce reqData = (RedditToSalesforce)JSON.deserialize(RestContext.Request.requestBody.toString(), RedditToSalesforce.class);
            Reddit_Comment__c redditComment = new Reddit_Comment__c();
            redditComment.Comment__c = reqData.data.body;
            redditComment.Author__c = reqData.data.author.name;
            redditComment.Reddit_Id__c = reqData.data.id;
            upsert redditComment Reddit_Id__c;
            return redditComment.Id;
        } else {
            return 'Error trying to save the comment';
        }
    }
}