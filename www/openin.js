
var exec = require('cordova/exec'),
  channel = require('cordova/channel'),

  // Reference name for the plugin
  PLUGIN_NAME = 'openin',


// Plugin methods on the native side that can be called from JavaScript
pluginNativeMethod = {
  SUBSCRIBE: 'jsSubscribeForEvent',
  UNSUBSCRIBE: 'jsUnsubscribeFromEvent'
};

function openin() {
  var me = this;
}

  /**
   * Subscribe to event.
   * If plugin already captured that event - callback will be called immidietly.
   *

   * @param {Function} callback - callback that is called when event is captured
   */
  openin.prototype.subscribe =  function(callback) {
    if (!callback) {
      console.warn('OpenIn: can\'t subscribe to event without a callback');
      return;
    }

    var innerCallback = function(msg) {
      callback(msg);
    };

    exec(innerCallback, null, PLUGIN_NAME, pluginNativeMethod.SUBSCRIBE,[]);
  }

window.openIn = new openin();
window.plugins = window.plugins || {};
window.plugins.openIn = window.openIn;
module.exports = new openin();
