import { LightningElement, api, wire, track } from 'lwc';
import getTimeline from '@salesforce/apex/TimelineController.getTimeline';

export default class Timeline extends LightningElement {

    @track timelines;

    @api userName;

    @wire(getTimeline) 
    wireGetTimeline({error, data}) { 
    	if (data) {
            this.timelines = data;
        } else if (error) {
        	console.error(error);
        }
    }
}