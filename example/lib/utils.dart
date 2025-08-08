// JS: Data layer push override
const dataLayerPushOverride = '''
console.log('Injecting JavaScript to override push method');

// Helper function to determine if we need to submit
function shouldSubmit(args) {
    for (let i = 0; i < args.length; i++) {
        const arg = args[i];

        // Case 1: track == 'submit'
        if (arg && typeof arg === 'object' && arg.track === 'submit') {
            return true;
        }

        // Case 2: track == 'event'
        if (arg && typeof arg === 'object' && arg.track === 'event') {
            return true;
        }

        // Case 3: second argument is true
        if (args.length > 1 && args[1] === true) {
            return true;
        }
    }

    return false;
}

// If the _jts array is not empty, we need to push the existing items to the Flutter side in batches
if (window._jts && window._jts.length > 0) {
    let batch = [];
    for (let i = 0; i < window._jts.length; i++) {
        batch.push(window._jts[i]);

        if (shouldSubmit([window._jts[i]])) {
            // Send the batch (including the submit-triggering event)
            const response = JSON.stringify({
                events: JSON.stringify(batch),
                submit: true,
            });

            console.log('Sending initial JTS batch to Flutter: ', response);
            flutterMessageHandler.postMessage(response);

            batch = [];
        }
    }
    // Send any remaining events as a final batch (submit: false)
    if (batch.length > 0) {
        const response = JSON.stringify({
            events: JSON.stringify(batch),
            submit: false,
        });
        
        console.log('Sending initial JTS batch to Flutter: ', response);
        flutterMessageHandler.postMessage(response);
    }
}

window._jts.push = function(...args) {
    // Call the original push to add all new items to the array
    Array.prototype.push.apply(this, args);
    
    let submit = shouldSubmit(args);

    const response = JSON.stringify({
        events: JSON.stringify(args),
        submit: submit,
    });

    console.log('Sending JTS events to Flutter: ', response);

    flutterMessageHandler.postMessage(response);

    // Return the new length of the array (standard push behavior)
    return this.length;
};
''';

// HTML: JS-bridge example
// This HTML snippet can be used to test the web view bridge functionality.
const jsBridgeExample = '''
<html>
    <head>
        <title>Web-View-Bridge</title>
        <style>
            #debug-log-container {
                position: relative;
                display: inline-block;
                width: 100%;
            }

            #debug-log {
                position: relative;
                font-family: "SFMono-Regular", Consolas, "Liberation Mono", Menlo, Courier, monospace;
                font-size: 13px;
                background: #f5f5f5;
                color: #222;
                border: 1px solid #ccc;
                padding: 8px;
                margin-top: 24px;
                max-height: 200px;
                overflow-y: auto;
                white-space: pre-wrap;
            }

            #copy-debug-log {
                position: absolute;
                top: 32px;
                right: 8px;
                opacity: 0.7;
                padding: 2px;
                z-index: 1;
            }

            #copied-feedback {
                position: absolute;
                top: 45px;
                right: 40px;
                background: #222;
                color: #fff;
                padding: 2px 8px;
                border-radius: 4px;
                font-size: 12px;
                opacity: 0;
                z-index: 1;
                transform: translateY(-50%);
            }
            #copied-feedback.visible {
                opacity: 1;
            }
        </style>
        <script type="text/javascript">
            // Jentis data layer example
            window._jts = [
              { track: "pageview" },
              { track: "submit" },
              {
                track: "pageview",
                pagetitle: "Demo-APP Order Confirmed"
              },
              {
                track: "product",
                type: "order",
                id: "123",
                name: "Testproduct",
                brutto: 199.99
              },
              {
                track: "product",
                type: "order",
                id: "456",
                name: "Testproduct 2",
                brutto: 299.99
              },
              {
                track: "order",
                orderid: "12345666",
                paytype: "creditcard",
                brutto: 499.98
              }
            ];

            // Console log override: append to debug container and call original
            console.log('Overriding console.log behavior');
            (function() {
                // Save the original console.log function
                const origLog = console.log;

                // Helper to pad numbers to two digits (e.g., 09)
                function pad(n) { return n < 10 ? '0' + n : n; }

                // Helper to get a timestamp string (HH:mm:ss)
                function timestamp() {
                    var d = new Date();
                    return pad(d.getHours()) + ':' + pad(d.getMinutes()) + ':' + pad(d.getSeconds());
                }

                // Override console.log
                console.log = function() {
                    // Call the original console.log so logs still appear in the browser console
                    origLog.apply(console, arguments);
                    
                    // Find the debug log container
                    var logContainer = document.getElementById('debug-log');
                    if (logContainer) {
                        // Convert all arguments to strings, JSON-stringify objects
                        var msg = Array.prototype.map.call(arguments, function(a) {
                            return (typeof a === 'object' ? JSON.stringify(a) : String(a));
                        }).join(' ');

                        // Append the log message with a timestamp
                        logContainer.textContent += '[' + timestamp() + '] ' + msg + '\\n\\n';

                        // Scroll to the bottom to show the latest log
                        logContainer.scrollTop = logContainer.scrollHeight;
                    }
                };
            })();
        </script>
    </head>
    <body>
        <h1>Web-View-Bridge</h1>
        <p>This is a simple example of a web view that communicates with the Jentis SDK.</p>

        <!-- Test Buttons -->
        <button id="btn-pageview" type="button">Push pageview event</button>
        <button id="btn-submit" type="button">Push submit event</button>

        <div id="debug-log-container">
            <button id="copy-debug-log" title="Copy log to clipboard" aria-label="Copy log">
                <svg width="18" height="18" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect x="5" y="7" width="9" height="10" rx="2" stroke="#222" stroke-width="1.5" fill="#fff"/>
                    <rect x="7" y="3" width="9" height="10" rx="2" stroke="#222" stroke-width="1.5" fill="#fff"/>
                </svg>
            </button>
            <span id="copied-feedback">Copied!</span>
            <pre id="debug-log"></pre>
        </div>

        <script type="text/javascript">
            // Add event listeners for test buttons
            document.getElementById('btn-pageview').onclick = function() {
                window._jts.push({ track: 'pageview' });
            };
            document.getElementById('btn-submit').onclick = function() {
                window._jts.push({ track: 'submit' });
            };

            // Copy debug log to clipboard
            document.getElementById('copy-debug-log').onclick = function() {
                const log = document.getElementById('debug-log').textContent;
                if (navigator.clipboard) {
                    navigator.clipboard.writeText(log).then(function() {
                        showCopiedFeedback();
                    });
                } else if (Clipboard) {
                    // Use Flutter JavaScript channel as fallback
                    Clipboard.postMessage(log);
                    showCopiedFeedback();
                } else {
                    console.log('Failed to copy log');
                }
            };
            
            function showCopiedFeedback() {
                // Show feedback message
                const feedback = document.getElementById('copied-feedback');
                feedback.classList.add('visible');

                // Hide feedback after 2 seconds
                setTimeout(function() {
                    feedback.classList.remove('visible');
                }, 2000);
            }
        </script>
    </body>
</html>''';
