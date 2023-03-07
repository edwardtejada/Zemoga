@IsTest
public class RedditMgmtTest {
    
    @IsTest
    static void createCommentTest() {
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/v1/RedditMgmt'; 
        req.httpMethod = 'Post';
        req.addHeader('Content-Type', 'application/json'); 
        req.requestBody = Blob.valueof('{ "data": { "id": "faab0e4", "body": "This meme implies that we arent already allies with r/lotrmemes. If it werent for them we wouldve lost the great meme wars.", "created_utc": "2019-12-09T15:45:18", "author": { "id": "fdqaa", "name": "suckit5253" } } }');
        RestContext.request = req;
        RestContext.response = res; 
        Test.startTest();
            RedditMgmt.createComment();
            List<Reddit_Comment__c> redditCommentList = [
                SELECT Id, Name, Author__c 
                FROM Reddit_Comment__c
            ];
            System.assert(redditCommentList[0].Author__c == 'suckit5253');
        Test.stopTest();   
    }
}