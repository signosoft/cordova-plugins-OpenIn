
var exec = require('cordova/exec'),
  channel = require('cordova/channel'),

  // Reference name for the plugin
  PLUGIN_NAME = 'OpenIn',


// Plugin methods on the native side that can be called from JavaScript
pluginNativeMethod = {
  SUBSCRIBE: 'jsSubscribeForEvent',
  UNSUBSCRIBE: 'jsUnsubscribeFromEvent'
};

var openin = {

  /**
   * Subscribe to event.
   * If plugin already captured that event - callback will be called immidietly.
   *

   * @param {Function} callback - callback that is called when event is captured
   */
  subscribe: function(callback) {
    if (!callback) {
      console.warn('OpenIn: can\'t subscribe to event without a callback');
      return;
    }

 

    var innerCallback = function(msg) {
      callback(msg.data);
    };

    exec(innerCallback, null, PLUGIN_NAME, pluginNativeMethod.SUBSCRIBE,[]);
  },

  /**
   * Unsubscribe from the event.
   *
   * @param {String} eventName - from what event we are unsubscribing
   */
  unsubscribe: function(eventName) {
 

    exec(null, null, PLUGIN_NAME, pluginNativeMethod.UNSUBSCRIBE,[]);
  }
};

module.exports = openin;
