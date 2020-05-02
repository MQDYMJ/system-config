#!/usr/bin/env perl
use strict;
use Encode;
my %unicode_wx_map;
while (<>) {
    print;
}
exit;

$unicode_wx_map{"🀄"} = ""; #  1F004;MAHJONG TILE RED DRAGON;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🅰"} = ""; #  1F170;NEGATIVE SQUARED LATIN CAPITAL LETTER A;So;0;L;;;;;N;;;;;
$unicode_wx_map{"🅱"} = ""; #  1F171;NEGATIVE SQUARED LATIN CAPITAL LETTER B;So;0;L;;;;;N;;;;;
$unicode_wx_map{"🅾"} = ""; #  1F17E;NEGATIVE SQUARED LATIN CAPITAL LETTER O;So;0;L;;;;;N;;;;;
$unicode_wx_map{"🅿"} = ""; #  1F17F;NEGATIVE SQUARED LATIN CAPITAL LETTER P;So;0;L;;;;;N;;;;;
$unicode_wx_map{"🆎"} = ""; #  1F18E;NEGATIVE SQUARED AB;So;0;L;;;;;N;;;;;
$unicode_wx_map{"🆒"} = ""; #  1F192;SQUARED COOL;So;0;L;;;;;N;;;;;
$unicode_wx_map{"🆔"} = ""; #  1F194;SQUARED ID;So;0;L;;;;;N;;;;;
$unicode_wx_map{"🆕"} = ""; #  1F195;SQUARED NEW;So;0;L;;;;;N;;;;;
$unicode_wx_map{"🆗"} = ""; #  1F197;SQUARED OK;So;0;L;;;;;N;;;;;
$unicode_wx_map{"🆙"} = ""; #  1F199;SQUARED UP WITH EXCLAMATION MARK;So;0;L;;;;;N;;;;;
$unicode_wx_map{"🆚"} = ""; #  1F19A;SQUARED VS;So;0;L;;;;;N;;;;;
$unicode_wx_map{"🈁"} = ""; #  1F201;SQUARED KATAKANA KOKO;So;0;L;<square> 30B3 30B3;;;;N;;;;;
$unicode_wx_map{"🈂"} = ""; #  1F202;SQUARED KATAKANA SA;So;0;L;<square> 30B5;;;;N;;;;;
$unicode_wx_map{"🈚"} = ""; #  1F21A;SQUARED CJK UNIFIED IDEOGRAPH-7121;So;0;L;<square> 7121;;;;N;;;;;
$unicode_wx_map{"🈯"} = ""; #  1F22F;SQUARED CJK UNIFIED IDEOGRAPH-6307;So;0;L;<square> 6307;;;;N;;;;;
$unicode_wx_map{"🈳"} = ""; #  1F233;SQUARED CJK UNIFIED IDEOGRAPH-7A7A;So;0;L;<square> 7A7A;;;;N;;;;;
$unicode_wx_map{"🈵"} = ""; #  1F235;SQUARED CJK UNIFIED IDEOGRAPH-6E80;So;0;L;<square> 6E80;;;;N;;;;;
$unicode_wx_map{"🈶"} = ""; #  1F236;SQUARED CJK UNIFIED IDEOGRAPH-6709;So;0;L;<square> 6709;;;;N;;;;;
$unicode_wx_map{"🈷"} = ""; #  1F237;SQUARED CJK UNIFIED IDEOGRAPH-6708;So;0;L;<square> 6708;;;;N;;;;;
$unicode_wx_map{"🈸"} = ""; #  1F238;SQUARED CJK UNIFIED IDEOGRAPH-7533;So;0;L;<square> 7533;;;;N;;;;;
$unicode_wx_map{"🈹"} = ""; #  1F239;SQUARED CJK UNIFIED IDEOGRAPH-5272;So;0;L;<square> 5272;;;;N;;;;;
$unicode_wx_map{"🈺"} = ""; #  1F23A;SQUARED CJK UNIFIED IDEOGRAPH-55B6;So;0;L;<square> 55B6;;;;N;;;;;
$unicode_wx_map{"🉐"} = ""; #  1F250;CIRCLED IDEOGRAPH ADVANTAGE;So;0;L;<circle> 5F97;;;;N;;;;;
$unicode_wx_map{"🌀"} = ""; #  1F300;CYCLONE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌂"} = ""; #  1F302;CLOSED UMBRELLA;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌃"} = ""; #  1F303;NIGHT WITH STARS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌄"} = ""; #  1F304;SUNRISE OVER MOUNTAINS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌅"} = ""; #  1F305;SUNRISE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌆"} = ""; #  1F306;CITYSCAPE AT DUSK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌇"} = ""; #  1F307;SUNSET OVER BUILDINGS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌈"} = ""; #  1F308;RAINBOW;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌉"} = ""; #  1F309;BRIDGE AT NIGHT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌊"} = ""; #  1F30A;WATER WAVE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌌"} = ""; #  1F30C;MILKY WAY;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌓"} = ""; #  1F313;FIRST QUARTER MOON SYMBOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌔"} = ""; #  1F314;WAXING GIBBOUS MOON SYMBOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌙"} = ""; #  1F319;CRESCENT MOON;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌛"} = ""; #  1F31B;FIRST QUARTER MOON WITH FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌟"} = ""; #  1F31F;GLOWING STAR;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌱"} = ""; #  1F331;SEEDLING;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌴"} = ""; #  1F334;PALM TREE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌵"} = ""; #  1F335;CACTUS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌷"} = ""; #  1F337;TULIP;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌸"} = ""; #  1F338;CHERRY BLOSSOM;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌹"} = ""; #  1F339;ROSE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌺"} = ""; #  1F33A;HIBISCUS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌻"} = ""; #  1F33B;SUNFLOWER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌼"} = ""; #  1F33C;BLOSSOM;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌾"} = ""; #  1F33E;EAR OF RICE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🌿"} = ""; #  1F33F;HERB;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍀"} = ""; #  1F340;FOUR LEAF CLOVER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍁"} = ""; #  1F341;MAPLE LEAF;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍂"} = ""; #  1F342;FALLEN LEAF;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍃"} = ""; #  1F343;LEAF FLUTTERING IN WIND;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍅"} = ""; #  1F345;TOMATO;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍆"} = ""; #  1F346;AUBERGINE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍉"} = ""; #  1F349;WATERMELON;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍊"} = ""; #  1F34A;TANGERINE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍎"} = ""; #  1F34E;RED APPLE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍏"} = ""; #  1F34F;GREEN APPLE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍓"} = ""; #  1F353;STRAWBERRY;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍔"} = ""; #  1F354;HAMBURGER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍘"} = ""; #  1F358;RICE CRACKER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍙"} = ""; #  1F359;RICE BALL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍚"} = ""; #  1F35A;COOKED RICE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍛"} = ""; #  1F35B;CURRY AND RICE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍜"} = ""; #  1F35C;STEAMING BOWL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍝"} = ""; #  1F35D;SPAGHETTI;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍞"} = ""; #  1F35E;BREAD;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍟"} = ""; #  1F35F;FRENCH FRIES;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍡"} = ""; #  1F361;DANGO;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍢"} = ""; #  1F362;ODEN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍣"} = ""; #  1F363;SUSHI;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍦"} = ""; #  1F366;SOFT ICE CREAM;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍧"} = ""; #  1F367;SHAVED ICE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍰"} = ""; #  1F370;SHORTCAKE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍱"} = ""; #  1F371;BENTO BOX;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍲"} = ""; #  1F372;POT OF FOOD;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍳"} = ""; #  1F373;COOKING;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍴"} = ""; #  1F374;FORK AND KNIFE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍵"} = ""; #  1F375;TEACUP WITHOUT HANDLE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍶"} = ""; #  1F376;SAKE BOTTLE AND CUP;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍷"} = ""; #  1F377;WINE GLASS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍸"} = ""; #  1F378;COCKTAIL GLASS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍹"} = ""; #  1F379;TROPICAL DRINK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍺"} = ""; #  1F37A;BEER MUG;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🍻"} = ""; #  1F37B;CLINKING BEER MUGS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎀"} = ""; #  1F380;RIBBON;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎁"} = ""; #  1F381;WRAPPED PRESENT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎂"} = ""; #  1F382;BIRTHDAY CAKE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎃"} = ""; #  1F383;JACK-O-LANTERN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎄"} = ""; #  1F384;CHRISTMAS TREE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎅"} = ""; #  1F385;FATHER CHRISTMAS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎆"} = ""; #  1F386;FIREWORKS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎇"} = ""; #  1F387;FIREWORK SPARKLER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎈"} = ""; #  1F388;BALLOON;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎉"} = ""; #  1F389;PARTY POPPER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎌"} = ""; #  1F38C;CROSSED FLAGS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎍"} = ""; #  1F38D;PINE DECORATION;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎎"} = ""; #  1F38E;JAPANESE DOLLS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎏"} = ""; #  1F38F;CARP STREAMER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎐"} = ""; #  1F390;WIND CHIME;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎑"} = ""; #  1F391;MOON VIEWING CEREMONY;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎒"} = ""; #  1F392;SCHOOL SATCHEL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎓"} = ""; #  1F393;GRADUATION CAP;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎡"} = ""; #  1F3A1;FERRIS WHEEL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎢"} = ""; #  1F3A2;ROLLER COASTER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎣"} = ""; #  1F3A3;FISHING POLE AND FISH;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎤"} = ""; #  1F3A4;MICROPHONE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎥"} = ""; #  1F3A5;MOVIE CAMERA;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎦"} = ""; #  1F3A6;CINEMA;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎧"} = ""; #  1F3A7;HEADPHONE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎨"} = ""; #  1F3A8;ARTIST PALETTE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎩"} = ""; #  1F3A9;TOP HAT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎫"} = ""; #  1F3AB;TICKET;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎬"} = ""; #  1F3AC;CLAPPER BOARD;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎭"} = ""; #  1F3AD;PERFORMING ARTS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎯"} = ""; #  1F3AF;DIRECT HIT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎰"} = ""; #  1F3B0;SLOT MACHINE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎱"} = ""; #  1F3B1;BILLIARDS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎵"} = ""; #  1F3B5;MUSICAL NOTE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎶"} = ""; #  1F3B6;MULTIPLE MUSICAL NOTES;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎷"} = ""; #  1F3B7;SAXOPHONE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎸"} = ""; #  1F3B8;GUITAR;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎺"} = ""; #  1F3BA;TRUMPET;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎼"} = ""; #  1F3BC;MUSICAL SCORE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎾"} = ""; #  1F3BE;TENNIS RACQUET AND BALL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🎿"} = ""; #  1F3BF;SKI AND SKI BOOT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏀"} = ""; #  1F3C0;BASKETBALL AND HOOP;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏁"} = ""; #  1F3C1;CHEQUERED FLAG;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏃"} = ""; #  1F3C3;RUNNER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏄"} = ""; #  1F3C4;SURFER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏆"} = ""; #  1F3C6;TROPHY;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏈"} = ""; #  1F3C8;AMERICAN FOOTBALL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏊"} = ""; #  1F3CA;SWIMMER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏠"} = ""; #  1F3E0;HOUSE BUILDING;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏡"} = ""; #  1F3E1;HOUSE WITH GARDEN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏢"} = ""; #  1F3E2;OFFICE BUILDING;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏣"} = ""; #  1F3E3;JAPANESE POST OFFICE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏥"} = ""; #  1F3E5;HOSPITAL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏦"} = ""; #  1F3E6;BANK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏧"} = ""; #  1F3E7;AUTOMATED TELLER MACHINE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏨"} = ""; #  1F3E8;HOTEL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏩"} = ""; #  1F3E9;LOVE HOTEL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏪"} = ""; #  1F3EA;CONVENIENCE STORE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏫"} = ""; #  1F3EB;SCHOOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏬"} = ""; #  1F3EC;DEPARTMENT STORE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏭"} = ""; #  1F3ED;FACTORY;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏮"} = ""; #  1F3EE;IZAKAYA LANTERN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏯"} = ""; #  1F3EF;JAPANESE CASTLE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🏰"} = ""; #  1F3F0;EUROPEAN CASTLE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐍"} = ""; #  1F40D;SNAKE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐎"} = ""; #  1F40E;HORSE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐑"} = ""; #  1F411;SHEEP;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐒"} = ""; #  1F412;MONKEY;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐔"} = ""; #  1F414;CHICKEN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐗"} = ""; #  1F417;BOAR;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐘"} = ""; #  1F418;ELEPHANT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐙"} = ""; #  1F419;OCTOPUS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐚"} = ""; #  1F41A;SPIRAL SHELL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐛"} = ""; #  1F41B;BUG;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐟"} = ""; #  1F41F;FISH;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐠"} = ""; #  1F420;TROPICAL FISH;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐡"} = ""; #  1F421;BLOWFISH;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐣"} = ""; #  1F423;HATCHING CHICK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐤"} = ""; #  1F424;BABY CHICK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐥"} = ""; #  1F425;FRONT-FACING BABY CHICK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐦"} = ""; #  1F426;BIRD;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐧"} = ""; #  1F427;PENGUIN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐨"} = ""; #  1F428;KOALA;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐩"} = ""; #  1F429;POODLE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐫"} = ""; #  1F42B;BACTRIAN CAMEL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐬"} = ""; #  1F42C;DOLPHIN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐭"} = ""; #  1F42D;MOUSE FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐮"} = ""; #  1F42E;COW FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐯"} = ""; #  1F42F;TIGER FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐰"} = ""; #  1F430;RABBIT FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐱"} = ""; #  1F431;CAT FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐳"} = ""; #  1F433;SPOUTING WHALE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐴"} = ""; #  1F434;HORSE FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐵"} = ""; #  1F435;MONKEY FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐶"} = ""; #  1F436;DOG FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐷"} = ""; #  1F437;PIG FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐸"} = ""; #  1F438;FROG FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐹"} = ""; #  1F439;HAMSTER FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐺"} = ""; #  1F43A;WOLF FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐻"} = ""; #  1F43B;BEAR FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐽"} = ""; #  1F43D;PIG NOSE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🐾"} = ""; #  1F43E;PAW PRINTS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👀"} = ""; #  1F440;EYES;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👂"} = ""; #  1F442;EAR;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👃"} = ""; #  1F443;NOSE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👄"} = ""; #  1F444;MOUTH;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👅"} = ""; #  1F445;TONGUE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👆"} = ""; #  1F446;WHITE UP POINTING BACKHAND INDEX;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👇"} = ""; #  1F447;WHITE DOWN POINTING BACKHAND INDEX;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👈"} = ""; #  1F448;WHITE LEFT POINTING BACKHAND INDEX;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👉"} = ""; #  1F449;WHITE RIGHT POINTING BACKHAND INDEX;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👊"} = ""; #  1F44A;FISTED HAND SIGN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👋"} = ""; #  1F44B;WAVING HAND SIGN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👌"} = ""; #  1F44C;OK HAND SIGN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👍"} = ""; #  1F44D;THUMBS UP SIGN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👎"} = ""; #  1F44E;THUMBS DOWN SIGN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👏"} = ""; #  1F44F;CLAPPING HANDS SIGN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👐"} = ""; #  1F450;OPEN HANDS SIGN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👑"} = ""; #  1F451;CROWN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👒"} = ""; #  1F452;WOMANS HAT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👔"} = ""; #  1F454;NECKTIE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👕"} = ""; #  1F455;T-SHIRT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👗"} = ""; #  1F457;DRESS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👘"} = ""; #  1F458;KIMONO;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👙"} = ""; #  1F459;BIKINI;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👚"} = ""; #  1F45A;WOMANS CLOTHES;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👜"} = ""; #  1F45C;HANDBAG;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👞"} = ""; #  1F45E;MANS SHOE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👟"} = ""; #  1F45F;ATHLETIC SHOE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👠"} = ""; #  1F460;HIGH-HEELED SHOE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👡"} = ""; #  1F461;WOMANS SANDAL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👢"} = ""; #  1F462;WOMANS BOOTS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👣"} = ""; #  1F463;FOOTPRINTS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👦"} = ""; #  1F466;BOY;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👧"} = ""; #  1F467;GIRL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👨"} = ""; #  1F468;MAN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👩"} = ""; #  1F469;WOMAN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👫"} = ""; #  1F46B;MAN AND WOMAN HOLDING HANDS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👮"} = ""; #  1F46E;POLICE OFFICER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👯"} = ""; #  1F46F;WOMAN WITH BUNNY EARS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👱"} = ""; #  1F471;PERSON WITH BLOND HAIR;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👲"} = ""; #  1F472;MAN WITH GUA PI MAO;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👳"} = ""; #  1F473;MAN WITH TURBAN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👴"} = ""; #  1F474;OLDER MAN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👵"} = ""; #  1F475;OLDER WOMAN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👶"} = ""; #  1F476;BABY;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👷"} = ""; #  1F477;CONSTRUCTION WORKER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👸"} = ""; #  1F478;PRINCESS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👻"} = ""; #  1F47B;GHOST;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👼"} = ""; #  1F47C;BABY ANGEL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👽"} = ""; #  1F47D;EXTRATERRESTRIAL ALIEN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👾"} = ""; #  1F47E;ALIEN MONSTER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"👿"} = ""; #  1F47F;IMP;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💀"} = ""; #  1F480;SKULL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💁"} = ""; #  1F481;INFORMATION DESK PERSON;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💂"} = ""; #  1F482;GUARDSMAN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💃"} = ""; #  1F483;DANCER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💄"} = ""; #  1F484;LIPSTICK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💅"} = ""; #  1F485;NAIL POLISH;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💆"} = ""; #  1F486;FACE MASSAGE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💇"} = ""; #  1F487;HAIRCUT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💈"} = ""; #  1F488;BARBER POLE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💉"} = ""; #  1F489;SYRINGE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💊"} = ""; #  1F48A;PILL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💋"} = ""; #  1F48B;KISS MARK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💌"} = ""; #  1F48C;LOVE LETTER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💍"} = ""; #  1F48D;RING;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💎"} = ""; #  1F48E;GEM STONE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💏"} = ""; #  1F48F;KISS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💐"} = ""; #  1F490;BOUQUET;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💑"} = ""; #  1F491;COUPLE WITH HEART;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💒"} = ""; #  1F492;WEDDING;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💓"} = ""; #  1F493;BEATING HEART;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💔"} = ""; #  1F494;BROKEN HEART;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💕"} = ""; #  1F495;TWO HEARTS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💖"} = ""; #  1F496;SPARKLING HEART;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💗"} = ""; #  1F497;GROWING HEART;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💘"} = ""; #  1F498;HEART WITH ARROW;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💙"} = ""; #  1F499;BLUE HEART;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💚"} = ""; #  1F49A;GREEN HEART;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💛"} = ""; #  1F49B;YELLOW HEART;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💜"} = ""; #  1F49C;PURPLE HEART;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💝"} = ""; #  1F49D;HEART WITH RIBBON;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💞"} = ""; #  1F49E;REVOLVING HEARTS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💟"} = ""; #  1F49F;HEART DECORATION;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💡"} = ""; #  1F4A1;ELECTRIC LIGHT BULB;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💢"} = ""; #  1F4A2;ANGER SYMBOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💣"} = ""; #  1F4A3;BOMB;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💤"} = ""; #  1F4A4;SLEEPING SYMBOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💦"} = ""; #  1F4A6;SPLASHING SWEAT SYMBOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💧"} = ""; #  1F4A7;DROPLET;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💨"} = ""; #  1F4A8;DASH SYMBOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💩"} = ""; #  1F4A9;PILE OF POO;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💪"} = ""; #  1F4AA;FLEXED BICEPS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💫"} = ""; #  1F4AB;DIZZY SYMBOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💰"} = ""; #  1F4B0;MONEY BAG;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💱"} = ""; #  1F4B1;CURRENCY EXCHANGE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💲"} = ""; #  1F4B2;HEAVY DOLLAR SIGN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💵"} = ""; #  1F4B5;BANKNOTE WITH DOLLAR SIGN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💹"} = ""; #  1F4B9;CHART WITH UPWARDS TREND AND YEN SIGN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💺"} = ""; #  1F4BA;SEAT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💻"} = ""; #  1F4BB;PERSONAL COMPUTER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💼"} = ""; #  1F4BC;BRIEFCASE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💽"} = ""; #  1F4BD;MINIDISC;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💾"} = ""; #  1F4BE;FLOPPY DISK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💿"} = ""; #  1F4BF;OPTICAL DISC;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📀"} = ""; #  1F4C0;DVD;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📃"} = ""; #  1F4C3;PAGE WITH CURL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📄"} = ""; #  1F4C4;PAGE FACING UP;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📇"} = ""; #  1F4C7;CARD INDEX;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📈"} = ""; #  1F4C8;CHART WITH UPWARDS TREND;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📊"} = ""; #  1F4CA;BAR CHART;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📋"} = ""; #  1F4CB;CLIPBOARD;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📑"} = ""; #  1F4D1;BOOKMARK TABS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📒"} = ""; #  1F4D2;LEDGER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📓"} = ""; #  1F4D3;NOTEBOOK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📔"} = ""; #  1F4D4;NOTEBOOK WITH DECORATIVE COVER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📕"} = ""; #  1F4D5;CLOSED BOOK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📖"} = ""; #  1F4D6;OPEN BOOK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📗"} = ""; #  1F4D7;GREEN BOOK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📘"} = ""; #  1F4D8;BLUE BOOK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📙"} = ""; #  1F4D9;ORANGE BOOK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📚"} = ""; #  1F4DA;BOOKS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📝"} = ""; #  1F4DD;MEMO;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📞"} = ""; #  1F4DE;TELEPHONE RECEIVER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📠"} = ""; #  1F4E0;FAX MACHINE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📡"} = ""; #  1F4E1;SATELLITE ANTENNA;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📢"} = ""; #  1F4E2;PUBLIC ADDRESS LOUDSPEAKER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📣"} = ""; #  1F4E3;CHEERING MEGAPHONE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📦"} = ""; #  1F4E6;PACKAGE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📧"} = ""; #  1F4E7;E-MAIL SYMBOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📨"} = ""; #  1F4E8;INCOMING ENVELOPE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📩"} = ""; #  1F4E9;ENVELOPE WITH DOWNWARDS ARROW ABOVE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📪"} = ""; #  1F4EA;CLOSED MAILBOX WITH LOWERED FLAG;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📫"} = ""; #  1F4EB;CLOSED MAILBOX WITH RAISED FLAG;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📮"} = ""; #  1F4EE;POSTBOX;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📱"} = ""; #  1F4F1;MOBILE PHONE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📲"} = ""; #  1F4F2;MOBILE PHONE WITH RIGHTWARDS ARROW AT LEFT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📳"} = ""; #  1F4F3;VIBRATION MODE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📴"} = ""; #  1F4F4;MOBILE PHONE OFF;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📶"} = ""; #  1F4F6;ANTENNA WITH BARS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📷"} = ""; #  1F4F7;CAMERA;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📹"} = ""; #  1F4F9;VIDEO CAMERA;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📺"} = ""; #  1F4FA;TELEVISION;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📻"} = ""; #  1F4FB;RADIO;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"📼"} = ""; #  1F4FC;VIDEOCASSETTE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔊"} = ""; #  1F50A;SPEAKER WITH THREE SOUND WAVES;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔍"} = ""; #  1F50D;LEFT-POINTING MAGNIFYING GLASS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔎"} = ""; #  1F50E;RIGHT-POINTING MAGNIFYING GLASS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔏"} = ""; #  1F50F;LOCK WITH INK PEN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔐"} = ""; #  1F510;CLOSED LOCK WITH KEY;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔑"} = ""; #  1F511;KEY;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔒"} = ""; #  1F512;LOCK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔓"} = ""; #  1F513;OPEN LOCK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔔"} = ""; #  1F514;BELL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔙"} = ""; #  1F519;BACK WITH LEFTWARDS ARROW ABOVE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔝"} = ""; #  1F51D;TOP WITH UPWARDS ARROW ABOVE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔞"} = ""; #  1F51E;NO ONE UNDER EIGHTEEN SYMBOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔥"} = ""; #  1F525;FIRE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔨"} = ""; #  1F528;HAMMER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔫"} = ""; #  1F52B;PISTOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔮"} = ""; #  1F52E;CRYSTAL BALL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔯"} = ""; #  1F52F;SIX POINTED STAR WITH MIDDLE DOT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔰"} = ""; #  1F530;JAPANESE SYMBOL FOR BEGINNER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔱"} = ""; #  1F531;TRIDENT EMBLEM;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔲"} = ""; #  1F532;BLACK SQUARE BUTTON;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔳"} = ""; #  1F533;WHITE SQUARE BUTTON;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔴"} = ""; #  1F534;LARGE RED CIRCLE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔵"} = ""; #  1F535;LARGE BLUE CIRCLE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔶"} = ""; #  1F536;LARGE ORANGE DIAMOND;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔷"} = ""; #  1F537;LARGE BLUE DIAMOND;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔸"} = ""; #  1F538;SMALL ORANGE DIAMOND;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🔹"} = ""; #  1F539;SMALL BLUE DIAMOND;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🕐"} = ""; #  1F550;CLOCK FACE ONE OCLOCK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🕑"} = ""; #  1F551;CLOCK FACE TWO OCLOCK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🕒"} = ""; #  1F552;CLOCK FACE THREE OCLOCK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🕓"} = ""; #  1F553;CLOCK FACE FOUR OCLOCK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🕔"} = ""; #  1F554;CLOCK FACE FIVE OCLOCK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🕕"} = ""; #  1F555;CLOCK FACE SIX OCLOCK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🕖"} = ""; #  1F556;CLOCK FACE SEVEN OCLOCK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🕗"} = ""; #  1F557;CLOCK FACE EIGHT OCLOCK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🕘"} = ""; #  1F558;CLOCK FACE NINE OCLOCK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🕙"} = ""; #  1F559;CLOCK FACE TEN OCLOCK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🕚"} = ""; #  1F55A;CLOCK FACE ELEVEN OCLOCK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🕛"} = ""; #  1F55B;CLOCK FACE TWELVE OCLOCK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🗻"} = ""; #  1F5FB;MOUNT FUJI;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🗼"} = ""; #  1F5FC;TOKYO TOWER;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🗽"} = ""; #  1F5FD;STATUE OF LIBERTY;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😁"} = ""; #  1F601;GRINNING FACE WITH SMILING EYES;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😂"} = ""; #  1F602;FACE WITH TEARS OF JOY;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😃"} = ""; #  1F603;SMILING FACE WITH OPEN MOUTH;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😄"} = ""; #  1F604;SMILING FACE WITH OPEN MOUTH AND SMILING EYES;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😅"} = "/:wipe"; #  1F605;SMILING FACE WITH OPEN MOUTH AND COLD SWEAT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😆"} = ""; #  1F606;SMILING FACE WITH OPEN MOUTH AND TIGHTLY-CLOSED EYES;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😉"} = ""; #  1F609;WINKING FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😊"} = ""; #  1F60A;SMILING FACE WITH SMILING EYES;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😋"} = ""; #  1F60B;FACE SAVOURING DELICIOUS FOOD;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😌"} = ""; #  1F60C;RELIEVED FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😍"} = ""; #  1F60D;SMILING FACE WITH HEART-SHAPED EYES;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😏"} = ""; #  1F60F;SMIRKING FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😒"} = ""; #  1F612;UNAMUSED FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😓"} = ""; #  1F613;FACE WITH COLD SWEAT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😔"} = ""; #  1F614;PENSIVE FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😖"} = ""; #  1F616;CONFOUNDED FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😘"} = ""; #  1F618;FACE THROWING A KISS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😚"} = ""; #  1F61A;KISSING FACE WITH CLOSED EYES;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😜"} = ""; #  1F61C;FACE WITH STUCK-OUT TONGUE AND WINKING EYE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😝"} = ""; #  1F61D;FACE WITH STUCK-OUT TONGUE AND TIGHTLY-CLOSED EYES;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😞"} = ""; #  1F61E;DISAPPOINTED FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😠"} = ""; #  1F620;ANGRY FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😡"} = ""; #  1F621;POUTING FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😢"} = ""; #  1F622;CRYING FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😣"} = ""; #  1F623;PERSEVERING FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😤"} = ""; #  1F624;FACE WITH LOOK OF TRIUMPH;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😥"} = ""; #  1F625;DISAPPOINTED BUT RELIEVED FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😨"} = ""; #  1F628;FEARFUL FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😩"} = ""; #  1F629;WEARY FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😪"} = ""; #  1F62A;SLEEPY FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😫"} = ""; #  1F62B;TIRED FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😭"} = ""; #  1F62D;LOUDLY CRYING FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😰"} = ""; #  1F630;FACE WITH OPEN MOUTH AND COLD SWEAT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😱"} = ""; #  1F631;FACE SCREAMING IN FEAR;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😲"} = ""; #  1F632;ASTONISHED FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😳"} = ""; #  1F633;FLUSHED FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😵"} = ""; #  1F635;DIZZY FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😷"} = ""; #  1F637;FACE WITH MEDICAL MASK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😸"} = ""; #  1F638;GRINNING CAT FACE WITH SMILING EYES;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😹"} = ""; #  1F639;CAT FACE WITH TEARS OF JOY;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😺"} = ""; #  1F63A;SMILING CAT FACE WITH OPEN MOUTH;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😻"} = ""; #  1F63B;SMILING CAT FACE WITH HEART-SHAPED EYES;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😼"} = "[Sly]"; #  1F63C;CAT FACE WITH WRY SMILE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😽"} = "[献吻]"; #  1F63D;KISSING CAT FACE WITH CLOSED EYES;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😾"} = ""; #  1F63E;POUTING CAT FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"😿"} = ""; #  1F63F;CRYING CAT FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🙀"} = ""; #  1F640;WEARY CAT FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🙅"} = ""; #  1F645;FACE WITH NO GOOD GESTURE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🙆"} = ""; #  1F646;FACE WITH OK GESTURE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🙇"} = ""; #  1F647;PERSON BOWING DEEPLY;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🙋"} = ""; #  1F64B;HAPPY PERSON RAISING ONE HAND;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🙌"} = ""; #  1F64C;PERSON RAISING BOTH HANDS IN CELEBRATION;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🙍"} = ""; #  1F64D;PERSON FROWNING;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🙎"} = ""; #  1F64E;PERSON WITH POUTING FACE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🙏"} = ""; #  1F64F;PERSON WITH FOLDED HANDS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚀"} = ""; #  1F680;ROCKET;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚃"} = ""; #  1F683;RAILWAY CAR;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚄"} = ""; #  1F684;HIGH-SPEED TRAIN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚅"} = ""; #  1F685;HIGH-SPEED TRAIN WITH BULLET NOSE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚇"} = ""; #  1F687;METRO;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚉"} = ""; #  1F689;STATION;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚌"} = ""; #  1F68C;BUS;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚏"} = ""; #  1F68F;BUS STOP;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚑"} = ""; #  1F691;AMBULANCE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚒"} = ""; #  1F692;FIRE ENGINE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚓"} = ""; #  1F693;POLICE CAR;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚕"} = ""; #  1F695;TAXI;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚗"} = ""; #  1F697;AUTOMOBILE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚙"} = ""; #  1F699;RECREATIONAL VEHICLE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚚"} = ""; #  1F69A;DELIVERY TRUCK;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚢"} = ""; #  1F6A2;SHIP;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚤"} = ""; #  1F6A4;SPEEDBOAT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚥"} = ""; #  1F6A5;HORIZONTAL TRAFFIC LIGHT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚧"} = ""; #  1F6A7;CONSTRUCTION SIGN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚨"} = ""; #  1F6A8;POLICE CARS REVOLVING LIGHT;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚬"} = ""; #  1F6AC;SMOKING SYMBOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚭"} = ""; #  1F6AD;NO SMOKING SYMBOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚲"} = ""; #  1F6B2;BICYCLE;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚶"} = ""; #  1F6B6;PEDESTRIAN;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚹"} = ""; #  1F6B9;MENS SYMBOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚺"} = ""; #  1F6BA;WOMENS SYMBOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚻"} = ""; #  1F6BB;RESTROOM;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚼"} = ""; #  1F6BC;BABY SYMBOL;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚽"} = ""; #  1F6BD;TOILET;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🚾"} = ""; #  1F6BE;WATER CLOSET;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"🛀"} = ""; #  1F6C0;BATH;So;0;ON;;;;;N;;;;;
$unicode_wx_map{"💳"} = "[信用卡]";
$unicode_wx_map{"😕"} = "/:?";
my $unicode_wx_regexp = "";
for (keys %unicode_wx_map) {
    $unicode_wx_regexp .= "$_|";
}
$unicode_wx_regexp = substr($unicode_wx_regexp, 0, -1);
$unicode_wx_regexp = qr($unicode_wx_regexp);
while (<>) {
    s/$unicode_wx_regexp/$unicode_wx_map{$&}/ge;
    print $_;
}

# /[Smile]       == /微笑   == /::)
# /[Grimace]     == /撇嘴   == /::~
# /[Drool]       == /色     == /::B
# /[Scowl]       == /发呆   == /::|
# /[CoolGuy]     == /得意   == /:8-)
# /[Sob]         == /流泪   == /::<
# /[Shy]         == /害羞   == /::$
# /[Silent]      == /闭嘴   == /::X
# /[Sleep]       == /睡     == /::Z
# /[Cry]         == /大哭   == /::'(
# /[Awkward]     == /尴尬   == /::-|
# /[Angry]       == /发怒   == /::@
# /[Tongue]      == /调皮   == /::P
# /[Grin]        == /呲牙   == /::D
# /[Surprise]    == /惊讶   == /::O
# /[Frown]       == /难过   == /::(
# /[Ruthless]    == /酷     == /::+
# /[Blush]       == /冷汗   == /:--b
# /[Scream]      == /抓狂   == /::Q
# /[Puke]        == /吐     == /::T
# /[Chuckle]     == /偷笑   == /:,@P
# /[Joyful]      == /可爱   == /:,@-D
# /[Slight]      == /白眼   == /::d
# /[Smug]        == /傲慢   == /:,@o
# /[Hungry]      == /饥饿   == /::g
# /[Drowsy]      == /困     == /:|-)
# /[Panic]       == /惊恐   == /::!
# /[Sweat]       == /流汗   == /::L
# /[Laugh]       == /憨笑   == /::>
# /[Commando]    == /大兵   == /::,@
# /[Determined]  == /奋斗   == /:,@f
# /[Scold]       == /咒骂   == /::-S
# /[Shocked]     == /疑问   == /:?
# /[Shhh]        == /嘘     == /:,@x
# /[Dizzy]       == /晕     == /:,@@
# /[Tormented]   == /折磨   == /::8
# /[Toasted]     == /衰     == /:,@!
# /[Skull]       == /骷髅   == /:!!!
# /[Hammer]      == /敲打   == /:xx
# /[Wave]        == /再见   == /:bye
# /[Speechless]  == /擦汗   == /:wipe
# /[NosePick]    == /抠鼻   == /:dig
# /[Clap]        == /鼓掌   == /:handclap
# /[Shame]       == /糗大了 == /:&-(
# /[Trick]       == /坏笑   == /:B-)
# /[Bah ! L]     == /左哼哼 == /:<@
# /[Bah ! R]     == /右哼哼 == /:@>
# /[Yawn]        == /哈欠   == /::-O
# /[Pooh-pooh]   == /鄙视   == /:>-|
# /[Shrunken]    == /委屈   == /:P-(
# /[TearingUp]   == /快哭了 == /::'|
# /[Sly]         == /阴险   == /:X-)
# /[Kiss]        == /亲亲   == /::*
# /[Wrath]       == /吓     == /:@x
# /[Whimper]     == /可怜   == /:8*
# /[Cleaver]     == /菜刀   == /:pd
# /[Watermelon]  == /西瓜   == /:<W>
# /[Beer]        == /啤酒   == /:beer
# /[Basketball]  == /篮球   == /:basketb
# /[PingPong]    == /乒乓   == /:oo
# /[Coffee]      == /咖啡   == /:coffee
# /[Rice]        == /饭     == /:eat
# /[Pig]         == /猪头   == /:pig
# /[Rose]        == /玫瑰   == /:rose
# /[Wilt]        == /凋谢   == /:fade
# /[Lips]        == /示爱   == /:showlove
# /[Heart]       == /爱心   == /:heart
# /[BrokenHeart] == /心碎   == /:break
# /[Cake]        == /蛋糕   == /:cake
# /[Lightning]   == /闪电   == /:li
# /[Bomb]        == /炸弹   == /:bome
# /[Dagger]      == /刀     == /:kn
# /[Soccer]      == /足球   == /:footb
# /[Ladybug]     == /瓢虫   == /:ladybug
# /[Poop]        == /便便   == /:shit
# /[Moon]        == /月亮   == /:moon
# /[Sun]         == /太阳   == /:sun
# /[Gift]        == /礼物   == /:gift
# /[Hug]         == /拥抱   == /:hug
# /[Strong]      == /强     == /:strong
# /[Weak]        == /弱     == /:weak
# /[Shake]       == /握手   == /:share
# /[Peace]       == /胜利   == /:v
# /[Fight]       == /抱拳   == /:@)
# /[Beckon]      == /勾引   == /:jj
# /[Fist]        == /拳头   == /:@@
# /[Pinky]       == /差劲   == /:bad
# /[RockOn]      == /爱你   == /:lvu
# /[NO]          == /NO     == /:no
# /[OK]          == /OK     == /:ok
# /[InLove]      == /爱情   == /:love
# /[Blowkiss]    == /飞吻   == /:<L>
# /[Waddle]      == /跳跳   == /:jump
# /[Tremble]     == /发抖   == /:shake
# /[Aaagh]       == /怄火   == /:<O>
# /[Twirl]       == /转圈   == /:circle
# /[Kotow]       == /磕头   == /:kotow
# /[Dramatic]    == /回头   == /:turn
# /[JumpRope]    == /跳绳   == /:skip
# /[Surrender]   == /挥手   == /:oY
# /[Exciting]    == /激动   == /:#-0
# /[HipHot]      == /街舞   == /:hiphot
# /[ShowLove]    == /献吻   == /:kiss
# /[Tai Chi L]   == /左太极 == /:<&
# /[Tai Chi R]   == /右太极 == /:&>
