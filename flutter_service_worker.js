'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "d94f0f937bd9b32f596c68e97bf94892",
"assets/AssetManifest.bin.json": "79c3d4a389988af8c13ca2a69ab67f2d",
"assets/AssetManifest.json": "98d02dad5182a0599017883993261c67",
"assets/assets/symbole/symbole01.png": "a13b9c551087508456ed2017a37d03af",
"assets/assets/symbole/symbole02.png": "1a0e8f2508aa6931970622e0868b3c74",
"assets/assets/symbole/symbole03.png": "721c4c407468cd55ed4dc3a6cd904db7",
"assets/assets/symbole/symbole04.png": "a6c6147e5dd5277ebd3d5bcca836bc7e",
"assets/assets/symbole/symbole05.png": "35e2ebfdffe3490d8f11545fd38415b9",
"assets/assets/symbole/symbole06.png": "3c2336145d5741c41762f5743bb5b3ef",
"assets/assets/symbole/symbole07.png": "047e6c1a837d8586ade29f6125f3f097",
"assets/assets/symbole/symbole08.png": "1b40437c98f0af92cf6a8bb51320dbf0",
"assets/assets/symbole/symbole09.png": "db0bdae6d6401fd899004561636e3b7a",
"assets/assets/symbole/symbole10.png": "5d66b39dbdd0b40f14e08f58c990e9ec",
"assets/assets/symbole/symbole11.png": "5c395db1a32a724b9b28d33505b29b88",
"assets/assets/symbole/symbole12.png": "676743f8a6727593cc695b261320a869",
"assets/assets/symbole/symbole13.png": "66ad96043001c4b5b096fe8183db11b2",
"assets/assets/symbole/symbole14.png": "a2da534dff06e5a5aca287d54fd50951",
"assets/assets/symbole/symbole15.png": "13b774288ecbda42523d008cfb550a5c",
"assets/assets/symbole/symbole16.png": "6fa369aad76075d16095d13174b0a632",
"assets/assets/symbole/symbole17.png": "a39b1e6aa92e0bea6bfbf2fba4f609f5",
"assets/assets/symbole/symbole18.png": "dfddc7943ffb19106869c0cae39c0582",
"assets/assets/symbole/symbole19.png": "4cea7fc20add96737f3c15558a39858a",
"assets/assets/symbole/symbole20.png": "0770ba578aadcd8796a2ae39bde759df",
"assets/assets/symbole/symbole21.png": "40e920344b7409e736e43c6130b9f5db",
"assets/assets/symbole/symbole22.png": "90a4728580e122c9129ec6eca74f9794",
"assets/assets/symbole/symbole23.png": "693334c6945c5c5a1bdff7289d6cfc3e",
"assets/assets/symbole/symbole24.png": "eed509b0597de49862b649b2c95fc9e8",
"assets/assets/symbole/symbole25.png": "ef0554b050fac7230364a9d9e34751ec",
"assets/assets/symbole/symbole26.png": "3288c200799c19664d25895dadd79beb",
"assets/assets/symbole/symbole27.png": "9a712b8531e307106fa4f40babd3225d",
"assets/assets/symbole/symbole28.png": "3f754f3e756a217388709907e37dbfe8",
"assets/assets/symbole/symbole29.png": "ab5fd18bf36f358d7aa971cc115c7fb9",
"assets/assets/symbole/symbole30.png": "cd808aad6e738e0767eb6a70e6e03f40",
"assets/assets/symbole/symbole31.png": "3e3e6617091fbcfaf230287c9f2d2e6f",
"assets/assets/symbole/symbole32.png": "1b8205ed20bbfcedddb4d8c19001dce3",
"assets/assets/symbole/symbole33.png": "c22220aa6d1e38400ba8c9520cbb4021",
"assets/assets/symbole/symbole34.png": "d5106ce663b9ca226a0558943a7d2415",
"assets/assets/symbole/symbole35.png": "cf1f7e91005cb6ba9d1635c108fc177b",
"assets/assets/symbole/symbole36.png": "f2c500f3ac57668f7edde9b2ec35c92d",
"assets/assets/symbole/symbole37.png": "f1cf664e01fe7f46d392358df0101cad",
"assets/assets/symbole/symbole38.png": "b846d544e5d04f1b30aaa76ea5042dfa",
"assets/assets/symbole/symbole39.png": "e8678ed1677638e5ba9d4dca840edbfe",
"assets/assets/symbole/symbole40.png": "f6abd34ee3d937192212dfbfc9073be0",
"assets/assets/symbole/symbole41.png": "0ca929716ee3174cce70f27862dfb08d",
"assets/assets/symbole/symbole42.png": "71c1073ca66804a06e563da87fd2edc4",
"assets/assets/symbole/symbole43.png": "5efbc8c2f9b567c570dc89eef74093ae",
"assets/assets/symbole/symbole44.png": "9a67f6d9b2306fbe99cca75206ab11fe",
"assets/assets/symbole/symbole45.png": "5eb73adb363ec717461f31b4a5e43c4d",
"assets/assets/symbole/symbole46.png": "bf01bf2899cdf623be071fe441464f8d",
"assets/assets/symbole/symbole47.png": "b790dcb5ba23d2e6e3339074eaa55375",
"assets/assets/symbole/symbole48.png": "66a07b2c2231b649d8504d6661efd5a9",
"assets/assets/symbole/symbole49.png": "66957cd14990c104259a69e2d63dabb9",
"assets/assets/symbole/symbole50.png": "5fef20f8491bfb8a1a6003e3e9a1d9b9",
"assets/assets/symbole/symbole51.png": "13bde6b186574dc1fa39d2e77bf2f35e",
"assets/assets/symbole/symbole52.png": "088ca00dda5215f02660ff8e2bdeb515",
"assets/assets/symbole/symbole53.png": "88e6b75be84b5060e10329e2587f153a",
"assets/assets/symbole/symbole54.png": "8976deb2e10191ffb40fca67fcc31a7f",
"assets/assets/symbole/symbole55.png": "da2ebe07b9a8623e156ad8dbcd3ba8b8",
"assets/assets/symbole/symbole56.png": "b73058c433e5f448f9f7ad493c15e273",
"assets/assets/symbole/symbole57.png": "aa207607f422112ce2ca307c51bc842c",
"assets/assets/symbole/symbole58.png": "48fb6db480a992d910eb89ff381b3d20",
"assets/assets/symbole/symbole59.png": "a995808333ce4247e0af343954499e17",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/NOTICES": "43def1d5343ed5476f1175b85c1bbca6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "f630a5331380e689cb91f9405dea81d8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "3432f6b165680b360dc8b5356f422d09",
"/": "3432f6b165680b360dc8b5356f422d09",
"main.dart.js": "59981b43027962978942597372178b0e",
"manifest.json": "6a4022eb1a8eb5a25a3c500305a1f6c5",
"version.json": "b32d14811e88466cdca1726452ac4f5f"};
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
