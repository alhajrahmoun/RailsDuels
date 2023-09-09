import { Controller } from "@hotwired/stimulus"

import * as bootstrap from "bootstrap"
import ClipboardJS from 'clipboard/dist/clipboard.min'

export default class extends Controller {
  connect() {
    let clipboard = new ClipboardJS('#clipboard-btn');

    clipboard.on('success', function(e) {
      const tooltip = new bootstrap.Tooltip(document.getElementById('clipboard-btn'));
      tooltip.show();

      e.clearSelection();
    });

  }
}
