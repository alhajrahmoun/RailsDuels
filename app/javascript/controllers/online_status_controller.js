import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
    static targets = ['count']

    connect() {
        let existingSubscription = this._findActiveSubscriptions();

        if (existingSubscription.length !== 0) {
            // Subscription already exists, so you don't need to create a new one
            this.channel = existingSubscription[0]
        } else {
            // No existing subscription found, create a new one
            this._createNewSubscription();
        }
    }

    disconnect() {
        let existingSubscription = this._findActiveSubscriptions();

        consumer.subscriptions.remove(existingSubscription[0]);

        consumer.disconnect();
    }

    _connected() {
        // Called when the subscription is ready for use on the server
        console.log('connected');
    }

    _disconnected() {
        // Called when the subscription has been terminated by the server
        console.log('disconnected');
    }

    _received(data) {
        // Called when there's incoming data on the websocket for this channel
        if (this.hasCountTarget) {
            this.countTarget.innerText = data;
        }
    }

    _createNewSubscription() {
        this.subscription = consumer.subscriptions.create({ channel: "OnlineStatusChannel" }, {
            connected: this._connected.bind(this),
            disconnected: this._disconnected.bind(this),
            received: this._received.bind(this)
        });
    }

    _findActiveSubscriptions() {
        let identifier = JSON.stringify({ channel: 'OnlineStatusChannel' })
        return consumer.subscriptions.findAll(identifier);
    }
}