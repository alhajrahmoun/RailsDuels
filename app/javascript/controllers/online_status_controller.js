import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
    static targets = ['count']

    connect() {
        this.subscription = consumer.subscriptions.create({ channel: "OnlineStatusChannel" }, {
            connected: this._connected.bind(this),
            disconnected: this._disconnected.bind(this),
            received: this._received.bind(this)
        });
    }

    disconnect() {
        consumer.subscriptions.remove(this.subscription);
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
}