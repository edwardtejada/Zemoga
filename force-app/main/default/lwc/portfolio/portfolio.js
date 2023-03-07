import { LightningElement, wire } from 'lwc';
import { getRecord } from "lightning/uiRecordApi";
import UserId from '@salesforce/user/Id';
import Name from "@salesforce/schema/User.Name";
import FirstName from "@salesforce/schema/User.FirstName";
import WorkExperience from "@salesforce/schema/User.Work_Experience__c";
import PhotoUrl from "@salesforce/schema/User.FullPhotoUrl";

export default class Portfolio extends LightningElement {
    userId = UserId;
    imageURL;
    userName;
    workExperience;
    firstName;

    @wire(getRecord, { recordId: '$userId', fields: [PhotoUrl, Name, WorkExperience, FirstName] })
    wiredRecord({ error, data }) {
        if (data) {
            this.imageURL = data.fields.FullPhotoUrl.value;
            this.userName = data.fields.Name.value;
            this.workExperience = data.fields.Work_Experience__c.value;
            this.firstName = data.fields.FirstName.value;
        } else if (error) {
            console.error(error);
        }
    }
}