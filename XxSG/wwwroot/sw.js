// Service Worker - cache shell only, game assets always fresh from server
const CACHE = 'tcc-v1';
const SHELL = ['/icon.png', '/icon512.png'];

self.addEventListener('install', e => {
    e.waitUntil(
        caches.open(CACHE).then(c => c.addAll(SHELL)).then(() => self.skipWaiting())
    );
});

self.addEventListener('activate', e => {
    e.waitUntil(
        caches.keys().then(keys =>
            Promise.all(keys.filter(k => k !== CACHE).map(k => caches.delete(k)))
        ).then(() => self.clients.claim())
    );
});

// Network first - game must always load fresh from server
self.addEventListener('fetch', e => {
    // Only handle GET, skip cross-origin WebSocket
    if (e.request.method !== 'GET') return;
    const url = new URL(e.request.url);
    if (url.protocol === 'ws:' || url.protocol === 'wss:') return;

    e.respondWith(
        fetch(e.request).catch(() =>
            caches.match(e.request).then(cached => cached || new Response(
                '<!DOCTYPE html><html><body style="background:#0a0a1a;color:#f0c060;font-family:sans-serif;display:flex;align-items:center;justify-content:center;height:100vh;margin:0;text-align:center"><div><h2>⚔️ Thánh Chiến Chibi</h2><p style="color:#aaa;margin:12px 0 24px">Mất kết nối. Kiểm tra mạng và thử lại.</p><button onclick="location.reload()" style="background:#c8a020;border:none;padding:12px 32px;border-radius:20px;font-size:16px;font-weight:bold">🔄 Thử lại</button></div></body></html>',
                {headers: {'Content-Type': 'text/html; charset=utf-8'}}
            ))
        )
    );
});
