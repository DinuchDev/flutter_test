'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "4350c511973b7945d8ded668d2d92bfe",
".git/config": "e952e29c64828bcdcc9c23e4f2045314",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "34bbf06f32c7506eacfd968f20000e14",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "2c7761018e575b2c75779a6bd70af27c",
".git/logs/refs/heads/gh-pages": "311ec72da03259489d2278a2a28a597f",
".git/logs/refs/heads/master": "fc4758c3c9ab92f407be1e1e84287b6b",
".git/logs/refs/remotes/origin/gh-pages": "ec6131ecc403d163c9ed9c63c2299815",
".git/logs/refs/remotes/origin/master": "bfbeff68cd56fe099e61b3389fbb6d45",
".git/objects/4b/825dc642cb6eb9a060e54bf8d69288fbee4904": "75589287973d2772c2fc69d664e10822",
".git/objects/7a/2f74cb6da4caf7bd7c6ea004a7781d4a939e1c": "3eef967ac1845dfec3b244e81802f81b",
".git/refs/heads/gh-pages": "fa2359ac740819a2c1ac9272117a6f10",
".git/refs/heads/master": "fa2359ac740819a2c1ac9272117a6f10",
".git/refs/remotes/origin/gh-pages": "fa2359ac740819a2c1ac9272117a6f10",
".git/refs/remotes/origin/master": "fa2359ac740819a2c1ac9272117a6f10",
"assets/AssetManifest.bin": "69a8d563bd4dbbcbefd3c7380e8ff462",
"assets/AssetManifest.bin.json": "dc7d64af7915d5217b979add28f0f519",
"assets/AssetManifest.json": "7d3143cc572036ef1aafb12911ae5741",
"assets/assets/fonts/khmerOs/KhmerOSBattambang-Bold.ttf": "6d5674c3fa8546e6e421b4dd4a60dd4d",
"assets/assets/fonts/khmerOs/KhmerOSBattambang-Regular.ttf": "a1c7c54f9518c00a3234a61a98e74724",
"assets/assets/fonts/khmerOs/KhmerOSContent-Bold.ttf": "1fae7a9d539fd3ec76cc2f87f140aca6",
"assets/assets/fonts/khmerOs/KhmerOSContent-Regular.ttf": "b612a85176d62f5cdaa99e8421f814cd",
"assets/assets/fonts/noto/NotoSansKhmer-Bold.ttf": "164acfb765b106aad6762e39e2d6f301",
"assets/assets/fonts/noto/NotoSansKhmer-Medium.ttf": "a73971010b8684dfe087863130488001",
"assets/assets/fonts/noto/NotoSansKhmer-Regular.ttf": "4d79a3a43e1c4c038f96e2bc58a3b1e1",
"assets/assets/fonts/noto/NotoSansKhmer-SemiBold.ttf": "ac779eb0b66ec13b5311a2aee9fb574f",
"assets/assets/png/Buva-Sea-card.png": "25fcdcd13b0eb3d711c98123105aa13f",
"assets/assets/png/BuvaSea-card-bgr.png": "4abcda0af31e505d6be392dca00a70ea",
"assets/assets/png/VET-Express-card.png": "5c32834c5eb4e4278adc172c7aa0ae6d",
"assets/assets/png/VetExpress-card-bgr.png": "3f4a796b1f2dfc8ee7b4819b30747020",
"assets/FontManifest.json": "7f67be2cb17b0fae055bb125afdb7a6e",
"assets/fonts/MaterialIcons-Regular.otf": "1d1b2c7f043990ff176744421ef6c541",
"assets/NOTICES": "6a3534a517e21d00ff80a3da4bc5dc72",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/flutter_js/assets/js/fetch.js": "277e0c5ec36810cbe57371a4b7e26be0",
"assets/packages/khmer_fonts/lib/src/fonts/Angkor/Angkor-Regular.ttf": "317e1e298aaa9650d1ec73bb19a48e64",
"assets/packages/khmer_fonts/lib/src/fonts/Battambang/Battambang-Bold.ttf": "02e3f317944b254e7909a0167631ac97",
"assets/packages/khmer_fonts/lib/src/fonts/Battambang/Battambang-Regular.ttf": "0af38f10ae3edd149636b62c628fc6e5",
"assets/packages/khmer_fonts/lib/src/fonts/Bayon/Bayon-Regular.ttf": "0d3182adbebb6fc2243122a553b6faf6",
"assets/packages/khmer_fonts/lib/src/fonts/Bokor/Bokor-Regular.ttf": "4656ee73ac424c47d093c9fb4eaee38c",
"assets/packages/khmer_fonts/lib/src/fonts/Chenla/Chenla-Regular.ttf": "d2443adf905ab998fb3e4ad32f42faab",
"assets/packages/khmer_fonts/lib/src/fonts/Content/Content-Bold.ttf": "cbd836605feb85369a3752cdf2b50bbe",
"assets/packages/khmer_fonts/lib/src/fonts/Content/Content-Regular.ttf": "d299148e167ea7591f150cfa2f8170d2",
"assets/packages/khmer_fonts/lib/src/fonts/Dangrek/Dangrek-Regular.ttf": "9761a03bae69841be9456f1a7b458047",
"assets/packages/khmer_fonts/lib/src/fonts/Fasthand/Fasthand-Regular.ttf": "376427f0755459620a6c34763ec3e2f2",
"assets/packages/khmer_fonts/lib/src/fonts/Freehand/Freehand-Regular.ttf": "dabc069df2a03655d3cca73529b71cc7",
"assets/packages/khmer_fonts/lib/src/fonts/Hanuman/Hanuman-Bold.ttf": "5d5a1c3671ac57370761afbaf4308204",
"assets/packages/khmer_fonts/lib/src/fonts/Hanuman/Hanuman-Regular.ttf": "67891d541e5cac9a5c4d468c2ed8cee7",
"assets/packages/khmer_fonts/lib/src/fonts/Kantumruy/Kantumruy-Bold.ttf": "ae1fb765ff23d28d817efe3d2c1db866",
"assets/packages/khmer_fonts/lib/src/fonts/Kantumruy/Kantumruy-Light.ttf": "1f4045e5110db471ec79b0d662625e7e",
"assets/packages/khmer_fonts/lib/src/fonts/Kantumruy/Kantumruy-Regular.ttf": "e8e6d0e3c3758b072e15cccf70774f77",
"assets/packages/khmer_fonts/lib/src/fonts/Kdam_Thmor/KdamThmor-Regular.ttf": "c26639aa19970301edbbf223c0e58200",
"assets/packages/khmer_fonts/lib/src/fonts/Khmer/Khmer-Regular.ttf": "e5278e93ad8cb71cb0bf8dc88186cb60",
"assets/packages/khmer_fonts/lib/src/fonts/Koulen/Koulen-Regular.ttf": "ab810ff609031f784159e0b30a87bd3e",
"assets/packages/khmer_fonts/lib/src/fonts/Metal/Metal-Regular.ttf": "e8109e53d77851064d2cb396c364c35b",
"assets/packages/khmer_fonts/lib/src/fonts/Moul/Moul-Regular.ttf": "fc76d9be66cf44cebb70bae887c6adb4",
"assets/packages/khmer_fonts/lib/src/fonts/Moulpali/Moulpali-Regular.ttf": "b6f1fb7292636a37cfa175713037aa17",
"assets/packages/khmer_fonts/lib/src/fonts/Nokora/Nokora-Bold.ttf": "bcb93d326c0b1c3d0ddd94791efede7f",
"assets/packages/khmer_fonts/lib/src/fonts/Nokora/Nokora-Regular.ttf": "34cad2904a238d9e4131d3c7b979bba5",
"assets/packages/khmer_fonts/lib/src/fonts/Odor_Mean_Chey/OdorMeanChey-Regular.ttf": "888d830d45a4a285063097648b356758",
"assets/packages/khmer_fonts/lib/src/fonts/Preahvihear/Preahvihear-Regular.ttf": "f842aeace321c7f3ed05b9bce5ce3a8d",
"assets/packages/khmer_fonts/lib/src/fonts/Siemreap/Siemreap-Regular.ttf": "a0225d821ae388e76736a07a836a0cd5",
"assets/packages/khmer_fonts/lib/src/fonts/Suwannaphum/Suwannaphum-Regular.ttf": "93fb4089b3626602469aba2cb0d78efe",
"assets/packages/khmer_fonts/lib/src/fonts/Taprom/Taprom-Regular.ttf": "634d67e0b022341f0606acc1192bf7f3",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "cf0c1dc6a38b9c4aa9a45e2f5c4a128b",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "718788847336106e756ca02d53e63a55",
"/": "718788847336106e756ca02d53e63a55",
"main.dart.js": "ca682583dc032013396254d446ba25b1",
"manifest.json": "3a5b6095130313cef6dbb5db78bc1986",
"version.json": "c72dd9007e6fa6ce5029cbe514299506"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
