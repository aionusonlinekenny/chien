import SwiftUI
import WebKit

struct GameWebView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []

        // Allow WebSocket and mixed content for HTTP game server
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        config.defaultWebpagePreferences = prefs

        // Disable cache so gamecfg.json always fresh
        let dataStore = WKWebsiteDataStore.nonPersistent()
        config.websiteDataStore = dataStore

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
        webView.isOpaque = false
        webView.backgroundColor = .black
        webView.scrollView.backgroundColor = .black

        // Allow navigation back gesture to be disabled (no swipe-back in game)
        webView.allowsBackForwardNavigationGestures = false

        context.coordinator.webView = webView
        context.coordinator.loadLogin(webView)

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    // MARK: - Coordinator
    class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
        weak var webView: WKWebView?

        // Saved credentials from last successful login
        private let credentialsKey = "game_credentials"

        func loadLogin(_ webView: WKWebView) {
            if let saved = loadSavedCredentials() {
                // Has saved credentials → go directly to game
                loadGame(webView, user: saved.user, sign: saved.sign)
            } else {
                // No credentials → show login page
                loadLoginPage(webView)
            }
        }

        func loadLoginPage(_ webView: WKWebView) {
            guard let url = URL(string: "http://134.22.38.31/") else { return }
            webView.load(URLRequest(url: url))
        }

        func loadGame(_ webView: WKWebView, user: String, sign: String) {
            let urlStr = "http://134.22.38.31/game.php?user=\(user)&sign=\(sign)&check=1&loginURL=http://134.22.38.31"
            guard let url = URL(string: urlStr) else { return }
            var req = URLRequest(url: url)
            req.cachePolicy = .reloadIgnoringLocalCacheData
            webView.load(req)
        }

        // MARK: - Credential persistence
        struct Credentials: Codable {
            let user: String
            let sign: String
        }

        func saveCredentials(user: String, sign: String) {
            if let data = try? JSONEncoder().encode(Credentials(user: user, sign: sign)) {
                UserDefaults.standard.set(data, forKey: credentialsKey)
            }
        }

        func loadSavedCredentials() -> Credentials? {
            guard let data = UserDefaults.standard.data(forKey: credentialsKey),
                  let creds = try? JSONDecoder().decode(Credentials.self, from: data) else {
                return nil
            }
            return creds
        }

        func clearCredentials() {
            UserDefaults.standard.removeObject(forKey: credentialsKey)
        }

        // MARK: - WKNavigationDelegate
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            guard let url = navigationAction.request.url else {
                decisionHandler(.allow)
                return
            }

            let urlStr = url.absoluteString

            // Detect redirect to game.php with credentials → save them
            if urlStr.contains("game.php"), let comps = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                let params = Dictionary(uniqueKeysWithValues:
                    (comps.queryItems ?? []).compactMap { item -> (String, String)? in
                        guard let val = item.value else { return nil }
                        return (item.name, val)
                    }
                )
                if let user = params["user"], let sign = params["sign"], !user.isEmpty, !sign.isEmpty {
                    saveCredentials(user: user, sign: sign)
                }
            }

            decisionHandler(.allow)
        }

        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            showOfflinePage(webView)
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            // Only show offline if it's a network error, not a JS error
            let nsError = error as NSError
            if nsError.domain == NSURLErrorDomain {
                showOfflinePage(webView)
            }
        }

        func showOfflinePage(_ webView: WKWebView) {
            let html = """
            <!DOCTYPE html>
            <html>
            <head>
            <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
            <style>
            * { margin:0; padding:0; box-sizing:border-box; }
            body { background:#0a0a1a; color:#fff; font-family:-apple-system,sans-serif;
                   display:flex; flex-direction:column; align-items:center; justify-content:center;
                   height:100vh; text-align:center; padding:20px; }
            h2 { font-size:22px; margin-bottom:12px; color:#f0c060; }
            p  { font-size:14px; color:#aaa; margin-bottom:30px; }
            button { background:#c8a020; color:#000; border:none; padding:14px 40px;
                     border-radius:25px; font-size:16px; font-weight:bold; }
            </style>
            </head>
            <body>
            <h2>⚔️ Thánh Chiến Chibi</h2>
            <p>Không thể kết nối máy chủ.<br>Vui lòng kiểm tra mạng và thử lại.</p>
            <button onclick="window.location.reload()">🔄 Thử lại</button>
            </body>
            </html>
            """
            webView.loadHTMLString(html, baseURL: nil)
        }

        // MARK: - WKUIDelegate (handle JS alerts from game)
        func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String,
                     initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
            guard let root = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first?.windows.first?.rootViewController else {
                completionHandler()
                return
            }
            let alert = UIAlertController(title: "Thông báo", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in completionHandler() })
            root.present(alert, animated: true)
        }
    }
}
