'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "715fc83775c57aafc1992fb1b10edaae",
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
".git/index": "752e237794c1c295df56a0a6df660b8b",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "14d6de284a3116c49cc188fe5c9aacc6",
".git/logs/refs/heads/gh-pages": "5393df6a31fc247dcee45856ed43a6e5",
".git/logs/refs/heads/master": "fc4758c3c9ab92f407be1e1e84287b6b",
".git/logs/refs/remotes/origin/gh-pages": "101fa1ad586d8fd77f3b409bfd040ae9",
".git/logs/refs/remotes/origin/master": "bfbeff68cd56fe099e61b3389fbb6d45",
".git/objects/00/1add3b4c6898f08da777023376d43b111ca907": "bd63d23472db2a7f0de3f77649c74eed",
".git/objects/02/d379985de129bf1118143f9405993014d84a88": "49a3fd720a605cdff3cce75df2a0f8a8",
".git/objects/04/5d26b82f5b85dfd2cb5fe29a7673a56a2b01aa": "6231d6888fd8adca1cf641a088fe17bd",
".git/objects/05/a9058f513cce5faf1704e06e3c150688b0a01f": "e8d02f60cf87abd4c1de4b153dd696dc",
".git/objects/06/6c9bd4ee7741c8b23d6eb7da03dcec2c33af72": "446a2da6a94cd57331d011dc8648db16",
".git/objects/06/af69e7efa980e341d3af6454ee050fa1aee061": "e4e19179a97a93828d2c14c90413fa02",
".git/objects/0e/c409c8fd7f765e94a9715fa0a62d38a3ee6462": "cc780bb5daa0ee335b4f2f2471d1b2e6",
".git/objects/11/2eb7f2edac18298aa6c27d45700794ba5e4696": "ad9f67150ce7a0a26a4e8c83bc3e0940",
".git/objects/14/00b6843c1501adc44201f0ab01503cb1e7b6b3": "db4a7f458fb9990369b2916d9120934d",
".git/objects/14/b67a08021238e82bd47c59197d50909a7c2c53": "4f2b4efc495a245b87a05b78aa393bf6",
".git/objects/15/bef728f93f13c68602854b9f4b6d4c59268aac": "ede06fae5f33441a3d6545f5104a2776",
".git/objects/17/eacf7d5a38f558a738fd6465ab6b53a49e89ca": "95c80613d2075dde5f955e09356c5e42",
".git/objects/18/9b8cf8fe350bf11facad5769ba1c9eebe09f8b": "f9d9a03b68b592a638a95b60229cadcc",
".git/objects/1b/7841e08a0d00ceb5eac6a18aa75cc5d735a4e7": "b9b5dcbc4a75aa0f4e4a9f6f0332d35e",
".git/objects/1b/7b8015eae54565a77c6dec1ff6354d7edaa2d2": "b15a5ca87bde8ed13a938641640df091",
".git/objects/1c/e5b98149d63f6da7b293781e62a46b2469d3b3": "cd576d8d6a91fdde2a4aad1657c853d2",
".git/objects/1e/f0afb54f1ab917fe9d8c62260b453aec4acac5": "619b1b91984dfe9f472cb4963faf8388",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/20/3b2c1ead1df9f25377e52c4c4950b1ad4f67dc": "9bb1c1432bb0a3b183a906ad278923e5",
".git/objects/21/097c423bbfd5336ef4b0f5dd1c50cb4400d372": "891c8172e04a446408fe7a5de98e122b",
".git/objects/27/a297abdda86a3cbc2d04f0036af1e62ae008c7": "51d74211c02d96c368704b99da4022d5",
".git/objects/27/b754d103f5f16dae49a63a063ce0e37b634cf4": "706cf509f55aecbdd81eccdc2c74436b",
".git/objects/2c/126f9157d39e35daf1004dd9aebe0977a377f6": "1fea1d53c233592753669365dd483df4",
".git/objects/2e/f98d989ba38c403f40301d15520c5fef80fec5": "10a6d9f2fe2b4356ac5e703564797a8c",
".git/objects/2f/286c25b2c7326e169ac2129e3ecbddaff6e157": "c72a40a02b22a23c0ca9747bcd1db939",
".git/objects/32/a49c500109dae847947bc9581bee5dee420556": "0efc9459ca355d34d2d2449425e2fdcc",
".git/objects/34/a7e978c0402ae8776d4022860cb723af088173": "83f8afbb797a2a45333616d90e95b55d",
".git/objects/36/a739f60ee80fb0f8f6a69d4e70eae9bdc48f2e": "45cf1b1300cf5c216617684983bb0b3b",
".git/objects/3a/6551e95871064afa8a948843525e2d1581e251": "585312f2edd5693ed25528fe3aa68757",
".git/objects/3d/1a649fe54795eef009b2ca36663dac42a4b7c7": "e215c278ed05a7234602c25218ec326e",
".git/objects/3d/2a476d32a1f2d4df0ad24b0ce4e7c4798ce6b7": "a0466ea91e9da392e1802e8fa4e0fbc1",
".git/objects/41/2a2df6b2d8ca6085b20a07b92440d328dded16": "4e4d4d4c45a321a58e3ba1643ce8c9c1",
".git/objects/41/4e1d0ad77ab1779a1644c58776bff82eefc97d": "100df781458c3cf84bafb05512b44e96",
".git/objects/46/91d8271bf29e1253d4618fabf1a0f9a3b3ec30": "336b1d882a054c233748bc74095dfe5a",
".git/objects/47/e472897f63a3417630318cf101e51be06a36f6": "d41350da3f114982c7d52b192923f280",
".git/objects/4b/7a0177065a3c1b10f94df72d12eb6a0ef80102": "ffbfba29ffa2d297bbadfcdbc953264b",
".git/objects/4b/825dc642cb6eb9a060e54bf8d69288fbee4904": "75589287973d2772c2fc69d664e10822",
".git/objects/4c/3b87db9d4a337406bbeb011ef3a882997e1359": "d4110dd51cb831f2f6b2780281e255ba",
".git/objects/4c/ceb4ccc76f72510682823143e435041da3e141": "cb8b5036eadf58f371deb420143c58df",
".git/objects/4f/d86a3370537438cfcca80f5ba705be9fe52280": "8dce6b0c33d627964887afb2d4d5cec2",
".git/objects/50/bf98b49faf2b5471f142bad0fa297eda73b286": "d4957884eb6856986da73b3bd5386184",
".git/objects/53/fc5848123d97d6b1a18c8abab1bf14e749feb2": "8acff8a5c7bcfa0785b13a6737a83f9d",
".git/objects/5c/e10a6ba715baffb21e248e11be278ab3005354": "4a3eb9d2ac935c04a42d311e623133da",
".git/objects/61/2d8dfa73c020795e90cf1e09524d101f2b95bc": "f6d001c6ed2031935fa362975971b5c3",
".git/objects/62/db2cf491e69c0b7837e33b384abfa0bd3653c5": "63d996128701c2b06444ee33c336f9a6",
".git/objects/63/53225b143afed77a279e804a11a0c0cbde658e": "dec1fbc9e7deb1fd15bc561cce938d6e",
".git/objects/63/6931bcaa0ab4c3ff63c22d54be8c048340177b": "8cc9c6021cbd64a862e0e47758619fb7",
".git/objects/64/e9813c3c96f8cfdee15f1d19384e202daa44a6": "db30e62ca5de1a96dc259226368fb616",
".git/objects/65/305dab43d893de8fa6ce5e865941406d9f5fb3": "e28edb6388adf01375859ec9275b24fd",
".git/objects/69/7306d3594a4ab02f2a168980eca66604488683": "6a53d48ed794704402da4259e3f452d7",
".git/objects/6a/24366cbb8c6ae73233d252278b52651a6d4e3c": "34027faac4c15a9d6b55d7b70d345943",
".git/objects/6c/c5367ff822ae55bde1080202a3e12293d18def": "acd1ba1b296c790e52df654d3f19751a",
".git/objects/6c/fa092b70e330f73ebae3d7a6ae30db5508b290": "4b0a29127ac8f9c7b3fa0960f1c3fb72",
".git/objects/6d/5e7df0f24223de524dd4c6e6f561d582025a66": "39d227f2339b38a6e60ac1cf82da51cb",
".git/objects/6d/5f0fdc7ccbdf7d01fc607eb818f81a0165627e": "2b2403c52cb620129b4bbc62f12abd57",
".git/objects/6e/60a20be6803734727357c41d4110a964c6fc8c": "1c31ab7a01beb7724a4c5b725c6c9047",
".git/objects/6e/6d2d88755629fb9e477cdcc0edbe18234ca85e": "fea1d76990658ba4eeb1f4c4865858fc",
".git/objects/6e/8b526f46e5adfb188be5ade52176ad44268431": "223896f8c9b9a50507f8d600935feb1a",
".git/objects/72/9c48e6007482d0a4188e81fb781f2f21c6e3e2": "92dc2db26de345da83705120d37e9e6f",
".git/objects/72/b75ad5c00643bcf09ef2fb2a01bb97d100531a": "af51f7f58da8aa4b10cbbff629dcb5f2",
".git/objects/73/7f149c855c9ccd61a5e24ce64783eaf921c709": "1d813736c393435d016c1bfc46a6a3a6",
".git/objects/75/40d0b1abb6a4f9850422dce5242afa7b998818": "024db10f908a9787d8abd2aa55e41dbd",
".git/objects/79/8b2e1a8b660a235009dc6c676ef2cd13490313": "1c3eaad239c2172adeb7abae8c92de53",
".git/objects/7a/2f74cb6da4caf7bd7c6ea004a7781d4a939e1c": "3eef967ac1845dfec3b244e81802f81b",
".git/objects/7d/4c01f14d0f4ce2b1d84eb055f77d9341b71672": "cc2bedd7111d615c548cbd77efee999e",
".git/objects/81/ef7917a7c5a1d46f703373a7fca3a983cc284b": "9b8aa9ce7328023acd6f0ffeff6a38ea",
".git/objects/84/7263cd1221111b3e2f5299b24f6db0bdd25bbd": "bb92f1b984e0903b5add304afabf34c3",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/89/4ba62fe7645a1c4490cc641906948bacc695ee": "e9fd2aeb75747e0b0a0c57ae18533075",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8c/59773bee8314a8ffb4431593d0fb49f52e34c6": "2eb993d30677573ffd0e58484cc6a514",
".git/objects/91/87bb560f056d1a0628aa33fabd51f5aa3844cf": "1b7b68d4f5a3fc35d2fa7bcdf2d2f3bb",
".git/objects/92/6411b02016314d00da0fd6d3122b2aa9dac5ee": "d30e40b782af4ece85139f34d31625f9",
".git/objects/92/e1497caf81db9bee376b9f7da63a642bcd4db7": "18645e4f4d0038345da2aa69a83e58e9",
".git/objects/96/6af9d75afa358de102ccf749aa9c31b97dd52f": "18697f9eb2fe0f37469df21e89b0d7cc",
".git/objects/97/8a4d89de1d1e20408919ec3f54f9bba275d66f": "dbaa9c6711faa6123b43ef2573bc1457",
".git/objects/98/de295220534d890536ce743dbfa31d62c10a23": "100f8e5381072d3dc7913afefb922388",
".git/objects/9c/7d491dd145b81fb4c3244fb690549f90ce59f5": "b23d50552b78a00c3f3c294975afe03b",
".git/objects/9d/66fe9d79a31667624a8e7c4bc9b28dfb8799da": "e6fa2ceef9902ea2cbce0f736309dad3",
".git/objects/9d/978c9c60ea9cc24f4aa7d96b9109e756cba5a0": "5ea6860455e75f8583f0f809ecd38752",
".git/objects/a6/36bab62249a006fcf571c5b8f894bc36e979c2": "81237ecea3dac9e5021a17fb1157c298",
".git/objects/a6/a42a2562ed1c097a5eb41ef2567832737c1387": "0627b808faac76a080a9041bc4639a93",
".git/objects/a8/daeb668953a437eca0025742fd1c5fdb91af4c": "1c4fb885f4c90c768ad6f75ffa2b2701",
".git/objects/a9/91f51138ffe059d588003dc7936aff059a0428": "b73a35563fa129bd884d8b5c53ee9231",
".git/objects/ac/1221205eb6adc95e8a4b34965eabc0538db405": "9f4ec67cb995236bf1a8133898769ea9",
".git/objects/ad/2f90b78480aeb6608226d9db4ecbd3ec06aaeb": "4add97a99941aa0e9eed0f2173416ade",
".git/objects/af/31ef4d98c006d9ada76f407195ad20570cc8e1": "a9d4d1360c77d67b4bb052383a3bdfd9",
".git/objects/af/9521db0a7c2ce02316e4900df24b9d29fc340f": "17af61f88ffb035e15208663c11ab610",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b1/afd5429fbe3cc7a88b89f454006eb7b018849a": "e4c2e016668208ba57348269fcb46d7b",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/70a7262e94ece054e9bff0325d7de193161ce1": "546616934c87b26faf26011793107de2",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/bc/0d675660291a458e85a64d0e878fc599c2be10": "bbc3946828b69b092bfa9cd5c4e9ebee",
".git/objects/bf/0c624d28e3dc100c3252b11045993fbf760479": "144341138688b94666c0b541e4052609",
".git/objects/c2/994b8fffb7d68f004629f3fb72f1ec5096b9f2": "53e55d1dd20a07f585c451e5836e2d53",
".git/objects/c3/e81f822689e3b8c05262eec63e4769e0dea74c": "8c6432dca0ea3fdc0d215dcc05d00a66",
".git/objects/c6/06caa16378473a4bb9e8807b6f43e69acf30ad": "ed187e1b169337b5fbbce611844136c6",
".git/objects/c6/27a553e8ce2f593bed150484a5f663f92e5401": "7d504400a598ae71e3f9f5b6b1938e59",
".git/objects/ca/ca9692ae4184d0902b8ee1dc1fcd2563cf4744": "63b8b2e5622b40102cdfa58a68087463",
".git/objects/cb/0c17312340b3a2839b7df9798263f6505fde9c": "ac9f0c39139ba50243a3aee886aac59d",
".git/objects/cb/3ed2e98ebd369bea4867915d04a21d938bedac": "a4d1bd9f91cdb742c46d3e7c1ad1284f",
".git/objects/cc/9bc31f4d54b604b88ca62509a6d36461234704": "1b4db91e3935b18aa66eb64766ff7f47",
".git/objects/cc/fab74c1f56c330985060e2247607eaedb3c7d7": "ad5b6117df489509af208438785f208b",
".git/objects/cd/69ae2f904a37d3d9b7cd98d1fd78493b753f08": "d57eda92bf6cf71a9bc0faaa9763df0a",
".git/objects/d1/50fe27988f9302450918e554a906bd7786f73e": "1972f5956e7b92b22a55c4be09b0d024",
".git/objects/d3/bdc85a367ac588ec67708c66b8c6cfbd5e54e6": "c06d7b56eb473940510b1f901747060c",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d8/ce209ddcc1e250bba5da5f198b09d85a986c90": "4b430da943ff0045ba11e459e646b6ae",
".git/objects/d9/472ee4634f1e5cf1312dfc153d7c491297c59b": "2e67d426232c405c6464e4971f1ec424",
".git/objects/da/4d107d00b2bd4d267cb15f30467f98798792cb": "4deca4e9d0c9c28ab6e74cb9cdbedb6c",
".git/objects/db/6d89801bb74a04ae31949b2ae8fb20536d10d3": "8462110437dd1efe8421b53e1b4ba233",
".git/objects/dc/17f7b52594e414d2752ea245d3b5ba12073d31": "cb65cc0931739869e4b0cc3f613c1a53",
".git/objects/de/716e510c33e844ff4ede00f127d99e5fcf62b2": "4754ac0a9328c37dfd1dcbeb2a35fe3c",
".git/objects/df/532b3e0d56fc145f0ac71a18ff38f0824d0250": "512cafd3d28251101b8fa84a30505056",
".git/objects/e2/7d680b0dd2be23a3bf90f89396e3d52ed2f2cc": "5834c9a7dbb9481735fae286960150d2",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ec/2fd6e0def7e65f79d5d635391627d540267673": "d9002bec55f75f9832149475bdca665e",
".git/objects/ec/361605e9e785c47c62dd46a67f9c352731226b": "d1eafaea77b21719d7c450bcf18236d6",
".git/objects/ed/16f90c3e6956ac6e5e5136d174609e498ddc18": "19e36b7f237b9eff986f5ad3c5c7257a",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f4/3d42ed0762a23e8600943c4c1545f5b8c202db": "b76bcb864adfac2825167864217b86bf",
".git/objects/f6/42927dd611a75f53f8b441217e978217ae1168": "fea9d79810c2ad7827b660bdf1b644d5",
".git/objects/fc/46a859cbf3875ad96f77b6d712ffe79f17adab": "ed6c343ca50c05a02c75d3f65b033752",
".git/objects/fe/c5a04e233e22653813cbb5026f3f7a53a5c9ba": "4f458ad1960447dd0d1bcb4947f649b6",
".git/refs/heads/gh-pages": "b97ee6040553ae582b0eb1dc4d4007f6",
".git/refs/heads/master": "fa2359ac740819a2c1ac9272117a6f10",
".git/refs/remotes/origin/gh-pages": "b97ee6040553ae582b0eb1dc4d4007f6",
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
"flutter_bootstrap.js": "369d13f8f238def8d555e4b39aa5300d",
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
