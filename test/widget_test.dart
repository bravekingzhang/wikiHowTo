// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wiki_howto_zh/main.dart';

import 'package:wiki_howto_zh/cache/lru_cache_manger.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  test('dis_lru', () async {
    var value = await LruFileCache().readCache('key-no');
    print(value);
    await LruFileCache().writeString("key1", "{xxxxx--yyyyy}");
    value = await LruFileCache().readCache("key1");
    print(value);

    var response = {
      "app": {
        "id": 2133329,
        "revision_id": 48075416,
        "title": "减掉大腿的赘肉",
        "fulltitle": "如何减掉大腿的赘肉",
        "url":
            "https://zh.wikihow.com/%E5%87%8F%E6%8E%89%E5%A4%A7%E8%85%BF%E7%9A%84%E8%B5%98%E8%82%89",
        "image": {
          "url":
              "https://www.wikihow.com/images_en/thumb/a/a2/Lose-Thigh-Fat-Step-9-Version-2.jpg/600px-nowatermark-Lose-Thigh-Fat-Step-9-Version-2.jpg",
          "width": 600,
          "height": 450,
          "large":
              "https://www.wikihow.com/images_en/thumb/a/a2/Lose-Thigh-Fat-Step-9-Version-2.jpg/1200px-nowatermark-Lose-Thigh-Fat-Step-9-Version-2.jpg",
          "large_width": 1200,
          "large_height": 900,
          "original":
              "https://www.wikihow.com/images_en/a/a2/Lose-Thigh-Fat-Step-9-Version-2.jpg",
          "original_width": 3200,
          "original_height": 2400
        },
        "abstract":
            " 想要减掉大腿的赘肉，就必须饮食和运动双管齐下。健身和健康饮食也能帮助你减掉身体其余部位的脂肪。如果你真的想要减掉大腿的赘肉，那就继续往下阅读吧！ 做深蹲运动。深蹲运动有很多做法，但基本的原理是一样的。双腿分开至与肩膀同宽，臀部下移直到大腿和地面平行。以这个姿势保持平衡至少3秒，再慢慢起来。http://www.fitnessmagazine.com/workout/thighs/exercises/top-thigh-exercises/ ",
        "sections": [
          {
            "html":
                "<p itemprop=\"description\">想要减掉大腿的赘肉，就必须饮食和运动双管齐下。健身和健康饮食也能帮助你减掉身体其余部位的脂肪。如果你真的想要减掉大腿的赘肉，那就继续往下阅读吧！ </p>",
            "type": "intro",
            "image": {
              "url":
                  "https://www.wikihow.com/images_en/thumb/a/a2/Lose-Thigh-Fat-Step-9-Version-2.jpg/600px-nowatermark-Lose-Thigh-Fat-Step-9-Version-2.jpg",
              "width": 600,
              "height": 450,
              "large":
                  "https://www.wikihow.com/images_en/thumb/a/a2/Lose-Thigh-Fat-Step-9-Version-2.jpg/1200px-nowatermark-Lose-Thigh-Fat-Step-9-Version-2.jpg",
              "large_width": 1200,
              "large_height": 900,
              "original":
                  "https://www.wikihow.com/images_en/a/a2/Lose-Thigh-Fat-Step-9-Version-2.jpg",
              "original_width": 3200,
              "original_height": 2400
            }
          },
          {
            "heading": "步骤",
            "type": "steps",
            "methods": [
              {
                "name": "进行针对大腿的运动",
                "type": "method",
                "steps": [
                  {
                    "num": "1",
                    "whvid": {
                      "lrgimg":
                          "https://www.wikihow.com/images/thumb/0/04/Lose-Thigh-Fat-Step-1-Version-5.jpg/550px-nowatermark-Lose-Thigh-Fat-Step-1-Version-5.jpg",
                      "smlimg":
                          "https://www.wikihow.com/images/thumb/0/04/Lose-Thigh-Fat-Step-1-Version-5.jpg/550px-nowatermark-Lose-Thigh-Fat-Step-1-Version-5.jpg",
                      "vid":
                          "https://www.wikihow.com/video/8/86/Lose%20Thigh%20Fat%20Step%201%20Version%203.360p.mp4"
                    },
                    "summary":
                        "<a title=\"做深蹲运动\" articleid=\"2135294\">做深蹲运动</a>。深蹲运动有很多做法，但基本的原理是一样的。双腿分开至与肩膀同宽，臀部下移直到大腿和地面平行。以这个姿势保持平衡至少3秒，再慢慢起来。[1]\n\n 用健身球做深蹲。靠墙放置健身球，用后腰牢牢地抵着球。健身球不仅能增加深蹲运动的强度，还能按摩背部。",
                    "html": ""
                  },
                  {
                    "num": "2",
                    "whvid": {
                      "lrgimg":
                          "https://www.wikihow.com/images/thumb/4/48/Lose-Thigh-Fat-Step-2-Version-5.jpg/518px-nowatermark-Lose-Thigh-Fat-Step-2-Version-5.jpg",
                      "smlimg":
                          "https://www.wikihow.com/images/thumb/4/48/Lose-Thigh-Fat-Step-2-Version-5.jpg/518px-nowatermark-Lose-Thigh-Fat-Step-2-Version-5.jpg",
                      "vid":
                          "https://www.wikihow.com/video/8/8f/Lose%20Thigh%20Fat%20Step%202%20Version%203.360p.mp4"
                    },
                    "summary":
                        "<a title=\"做弓步\" articleid=\"2138198\">做弓步</a>。双手各持一个2-4公斤的哑铃，一只腿往前迈一大步，同时屈起两侧膝盖，臀部下移，直到后侧膝盖离地面约2.",
                    "html":
                        "5厘米。身体上移，双腿伸直，慢慢回到起始姿势。前腿向后撤回，然后换边重复。<cite num=\"2\">[2]</cite>"
                  }
                ]
              },
              {},
              {}
            ]
          },
          {
            "heading": "小提示",
            "type": "tips",
            "list": [
              {"html": "空闲时，考虑到户外跑步或在小区散步。"},
              {"html": "一整天多喝水，胃部留给食物的空间就会减少，吃得更少有助于减肥。"},
              {"html": "多吃蔬菜，少吃垃圾食品，用健康的食物代替它们。你也可以尝试做原地爬山运动来减掉大腿赘肉。"},
              {"html": "每天至少走一万步！"},
              {"html": "跳舞和骑自行车能有效减掉赘肉。一有机会就多走路。"},
              {
                "html":
                    "不要老想着减肥这件事。专心锻炼，1-2个月后就会看到变化。如果你每1-2周就要抱怨体重没有下降，那么你是不会看到效果的。专心锻炼至少2-4个月再看看。"
              },
              {
                "html":
                    "能站着就不要坐着。站着可以消耗热量，而坐着会存储热量。想要消耗热量，最简单的方法就是少坐多站。看电视或打电话的时候不妨四处走动，虽然无法代替运动，但起码能增加活动量。"
              },
              {"html": "确保一整天饮食健康，而且要适度。"},
              {"html": "参加健身房的尊巴、瑜伽或其它锻炼腿部的健身课程。"},
              {"html": "每周练习瑜伽3-4次，每次15-20分钟。"}
            ]
          },
          {
            "heading": "警告",
            "type": "warnings",
            "list": [
              {
                "html":
                    "不要通过饿肚子来减肥。饥饿会促使身体放慢新陈代谢的速度，存储脂肪，为应付接下来长时间的饥饿做好准备。饿肚子不是有效的减肥方法，而且很不健康。"
              }
            ]
          },
          {
            "heading": "参考",
            "html":
                " <div id=\"references\" class=\"article_inner editable\"> <div class=\"references-small\"><div class=\"mw-references-wrap mw-references-columns\"><ol class=\"references\">\n<li id=\"_note-1\">  <span class=\"reference-text\"><a href=\"http://www.fitnessmagazine.com/workout/thighs/exercises/top-thigh-exercises/\">http://www.fitnessmagazine.com/workout/thighs/exercises/top-thigh-exercises/</a></span> </li> <li id=\"_note-2\">  <span class=\"reference-text\"><a href=\"http://www.acefitness.org/exercise-library-details/1/270/\">http://www.acefitness.org/exercise-library-details/1/270/</a></span> </li> <li id=\"_note-3\">  <span class=\"reference-text\"><a href=\"http://www.mayoclinic.org/healthy-lifestyle/nutrition-and-healthy-eating/in-depth/water/art-20044256\">http://www.mayoclinic.org/healthy-lifestyle/nutrition-and-healthy-eating/in-depth/water/art-20044256</a></span> </li> <li id=\"_note-4\">  <span class=\"reference-text\"><a href=\"http://www.fitnessforweightloss.com/how-many-calories-are-in-regular-soda/\">http://www.fitnessforweightloss.com/how-many-calories-are-in-regular-soda/</a></span> </li> <li id=\"_note-5\">  <span class=\"reference-text\"><a href=\"http://www.webmd.com/food-recipes/features/antioxidants-in-green-and-black-tea\">http://www.webmd.com/food-recipes/features/antioxidants-in-green-and-black-tea</a></span> </li> <li id=\"_note-6\">  <span class=\"reference-text\"><a href=\"http://www.webmd.com/food-recipes/tc/healthy-eating-overview\">http://www.webmd.com/food-recipes/tc/healthy-eating-overview</a></span> </li> <li id=\"_note-7\">  <span class=\"reference-text\"><a href=\"http://www.webmd.com/diet/features/6-reasons-to-get-your-diary\">http://www.webmd.com/diet/features/6-reasons-to-get-your-diary</a></span> </li> <li id=\"_note-8\">  <span class=\"reference-text\"><a href=\"http://diabetes.webmd.com/carbohydrate-counting-for-people-who-use-insulin\">http://diabetes.webmd.com/carbohydrate-counting-for-people-who-use-insulin</a></span> </li> <li id=\"_note-9\">  <span class=\"reference-text\"><a href=\"http://diet.lovetoknow.com/wiki/Atkins_Diet_Food_List\">http://diet.lovetoknow.com/wiki/Atkins_Diet_Food_List</a></span> </li> <li id=\"_note-10\">  <span class=\"reference-text\"><a href=\"http://www.webmd.com/diet/low-calorie-diet\">http://www.webmd.com/diet/low-calorie-diet</a></span> </li> <li id=\"_note-11\">  <span class=\"reference-text\"><a href=\"http://www.ketogenic-diet-resource.com/ketogenic-diet-plan.html\">http://www.ketogenic-diet-resource.com/ketogenic-diet-plan.html</a></span> </li> <li id=\"_note-12\">  <span class=\"reference-text\"><a href=\"http://health.howstuffworks.com/wellness/diet-fitness/weight-loss/lost-weight1.htm\">http://health.howstuffworks.com/wellness/diet-fitness/weight-loss/lost-weight1.htm</a></span> </li> <li id=\"_note-13\">  <span class=\"reference-text\"><a href=\"http://www.mayoclinic.com/health/arthritis/AR00009\">http://www.mayoclinic.com/health/arthritis/AR00009</a></span> </li> <li id=\"_note-14\">  <span class=\"reference-text\"><a href=\"http://abclocal.go.com/kabc/story?section=news/food_coach&amp;id=8437902\">http://abclocal.go.com/kabc/story?section=news/food_coach&amp;id=8437902</a></span> </li> <li id=\"_note-15\">  <span class=\"reference-text\"><a href=\"http://www.mayoclinic.com/health/exercise/SM00109\">http://www.mayoclinic.com/health/exercise/SM00109</a></span> </li> <li id=\"_note-16\">  <span class=\"reference-text\"><a href=\"http://www.webmd.com/diet/features/lose-weight-while-sleeping\">http://www.webmd.com/diet/features/lose-weight-while-sleeping</a></span> </li> <li id=\"_note-17\">  <span class=\"reference-text\"><a href=\"http://www.webmd.com/diet/features/lose-weight-while-sleeping?page=2\">http://www.webmd.com/diet/features/lose-weight-while-sleeping?page=2</a></span> </li> </ol></div></div> <p>\n</p> </div> "
          }
        ],
        "random": false,
        "authors": ["Xwang", "InterwikiBot", "WikiHow Retranslation"],
        "image_sources": {"uploaders": [], "licenses": []}
      }
    };
    await LruFileCache().writeString(
        'https://zh.wikihow.com/api.php?action=app&subcmd=article&id=2133329&format=json',
        json.encode(response));
    value = await LruFileCache().readCache(
        'https://zh.wikihow.com/api.php?action=app&subcmd=article&id=2133329&format=json');
    print(value);

    value = await LruFileCache().readCache('https://zh.wikihow.com/api.php?action=app&subcmd=article&id=2170749&format=json');
    print(value);
  });
}
