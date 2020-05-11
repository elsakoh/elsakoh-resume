'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "6b848d47eeb04d776f3c88144699f750",
"/": "6b848d47eeb04d776f3c88144699f750",
"main.dart.js": "bb6d8b16ff4a96f4c1e4581c640396df",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "0cd4c9d954c3e172e7515a3c1053e4e0",
"assets/SourceSansPro-BlackItalic.ttf": "9912ce7396adef3e4895d80f1db48c79",
"assets/SourceSansPro-SemiBoldItalic.ttf": "400001859e5426d443911e7b60009ba5",
"assets/LICENSE": "aa20a2844f73cf60f034c0a8faf56cd0",
"assets/SourceSansPro-Regular.ttf": "c1678b46f7dd3f50ceac94ed4e0ad01a",
"assets/images/napmap.gif": "2fece91b2b8307c8e70a79b8b8d78b67",
"assets/images/outside/outside_work.jpeg": "4470c32d1ff5c059f58117bafd3f4ad4",
"assets/images/outside/outside_workk.jpeg": "313d69bc5ee0c1affb5abae7b24dbe72",
"assets/images/stacklogo.png": "12eac1ccb8acadfb4e523b749f07dac9",
"assets/images/napmap2.gif": "ddb4b85ad3216b68df5ecf85a0ffcd7a",
"assets/images/kk.jpg": "d13c414bd12809f0511359a8d4b23e21",
"assets/images/napmap.jpg": "ded9e60b3fa75f42314f7ecde5a861bf",
"assets/images/about.jpg": "704e43e937b87b02a9d56a175ed9fd05",
"assets/images/elsa.jpg": "2905f314a2a51e7dc9c0f755cd931817",
"assets/web/assets/SourceSansPro-Bold.ttf": "8669b8706bbbdd1482e2fccc4ed96850",
"assets/web/assets/SourceSansPro-LightItalic.ttf": "54e87dedd7daccc391c61dc0795a97bd",
"assets/web/assets/SourceSansPro-Light.ttf": "81cd217e4a8160a930c6d5fb8d1e8e82",
"assets/web/assets/GoogleSansRegular.ttf": "b5c77a6aed75cdad9489effd0d5ea411",
"assets/SourceSansPro-Bold.ttf": "8669b8706bbbdd1482e2fccc4ed96850",
"assets/SourceSansPro-LightItalic.ttf": "54e87dedd7daccc391c61dc0795a97bd",
"assets/AssetManifest.json": "c043a1bf8997d5d8c28c02a0cd2e4b7a",
"assets/SourceSansPro-Light.ttf": "81cd217e4a8160a930c6d5fb8d1e8e82",
"assets/SourceSansPro-Black.ttf": "9ded577f93b24331f4faadfc5f834ae6",
"assets/GoogleSansRegular.ttf": "b5c77a6aed75cdad9489effd0d5ea411",
"assets/FontManifest.json": "718734758aa177fb4122e11d49327f4a",
"assets/OFL.txt": "f20c9954e7a1c7c2c3d0fa94b7f5bed6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/open_iconic_flutter/assets/open-iconic.woff": "3cf97837524dd7445e9d1462e3c4afe2",
"assets/SourceSansPro-ExtraLight.ttf": "23a4c2deef3a0cc9b40b429ad7320a18",
"assets/SourceSansPro-BoldItalic.ttf": "38845daef5ac62cb403040d0017fdd0a",
"assets/SourceSansPro-SemiBold.ttf": "83476a890be79f84e97b792c9c40d743",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/SourceSansPro-ExtraLightItalic.ttf": "542b437ac4636f19f2a5475170678e07",
"assets/SourceSansPro-Italic.ttf": "3d7cb86547ce5075625915f2e86d0687"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
