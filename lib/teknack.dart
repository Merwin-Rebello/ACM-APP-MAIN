import 'package:acm_app/globalComponents.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

import 'package:flutter/material.dart';

import 'globalComponents.dart';

class Teknack extends StatelessWidget {
  const Teknack({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final teknack_2023=[['img/logos-23/blocky-build.webp', 'https://play.google.com/store/apps/details?id=com.com.Teknack.BlockyBuild.BlockyBuild'],
      ['img/logos-23/burnout-blitz.webp', 'https://play.google.com/store/apps/details?id=com.com.Teknack.BurnoutBlitz.BurnoutBlitz'], ['img/logos-23/stunt-blaze.webp', 'https://play.google.com/store/apps/details?id=com.Teknack.stuntblaze'], ['img/logos-23/fence-maze.webp', 'https://play.google.com/store/apps/details?id=com.com.Teknack.FenceMaze.FenceMaze'], ['img/logos-23/dunkit.webp', 'https://play.google.com/store/apps/details?id=com.com.Teknack.Dunkit.Dunkit'], ['img/logos-23/TheLoneBot.webp', 'https://play.google.com/store/apps/details?id=com.Teknack.TheLoneBot'], ['img/logos-23/balloon-popperz.webp', 'https://play.google.com/store/apps/details?id=com.Teknack.BalloonPopperz'], ['img/logos-23/track-titans.webp', 'https://play.google.com/store/apps/details?id=com.com.Teknack.TheTrackTitans.TheTrackTitans'], ['img/logos-23/spacedive.webp', 'https://play.google.com/store/apps/details?id=com.com.Teknack.Spacedive.Spacedive'], ['img/logos-23/zombie-zapper.webp', 'https://play.google.com/store/apps/details?id=com.com.teknack.ZombieZapper.ZombieZapper']];
    final teknack_2022 = [
      [
        'img/logos-22/Jards.webp',
        'https://play.google.com/store/apps/details?id=com.Teknack.Jards'
      ],
      [
        'img/logos-22/Dyeforlyfe.webp',
        'https://play.google.com/store/apps/details?id=com.Teknack.DyeForLyfe'
      ],
      [
        'img/logos-22/Everknight.webp',
        'https://play.google.com/store/apps/details?id=com.Teknack.EverKnight'
      ],
      [
        'img/logos-22/PerilousWays.webp',
        'https://play.google.com/store/apps/details?id=com.Teknack.PerilousWays'
      ],
      [
        'img/logos-22/Anti-LimeRush.webp',
        'https://play.google.com/store/apps/details?id=com.Teknack.AntiLimeRush'
      ],
      [
        'img/logos-22/TankFest.webp',
        'https://play.google.com/store/apps/details?id=com.Teknack.TankFest'
      ],
      [
        'img/logos-22/Astrompy.webp',
        'https://play.google.com/store/apps/details?id=com.Teknack.Astrompy'
      ],
      [
        'img/logos-22/SkyGliders.webp',
        'https://play.google.com/store/apps/details?id=com.Teknack.SkyGliders'
      ],
      [
        'img/logos-22/SUSTheHiddenQuest.webp',
        'https://play.google.com/store/apps/details?id=com.Teknack.SUSTheHiddenQuest'
      ],
      [
        'img/logos-22/RescueBud.webp',
        'https://play.google.com/store/apps/details?id=com.Teknack.RescueBud'
      ],
      [
        'img/logos-22/ChaoticBeyblades.webp',
        'https://play.google.com/store/apps/details?id=com.Teknack.ChaoticBeyblades'
      ],
      [
        'img/logos-22/DawnOfSurvival.webp',
        'https://teknack.itch.io/dawn-of-survival'
      ],
      [
        'img/logos-22/Spacetronauts.webp',
        'https://play.google.com/store/apps/details?id=com.Spacetronauts'
      ],
      [
        'img/logos-22/trainbrain.webp',
        'https://play.google.com/store/apps/details?id=com.Teknack.TrainBrain'
      ],
      [
        'img/logos-22/Rollex.webp',
        'https://play.google.com/store/apps/details?id=com.Teknack.Rollex'
      ]
    ];

    final teknack_2021 = [
      [
        'img/logos-21/zenscape.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.Zenscape'
      ],
      [
        'img/logos-21/foodunk.jpg',
        'https://play.google.com/store/apps/details?id=com.Teknack.Foodunk'
      ],
      [
        'img/logos-21/enchantedwoods.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.EnchantedWoods'
      ],
      [
        'img/logos-21/trinitywarriors.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.TheTrinityWarriors'
      ],
      [
        'img/logos-21/shottyballs.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.ShootyBalls'
      ],
      [
        'img/logos-21/TLC_logo.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.TheLastCombat'
      ],
      [
        'img/logos-21/Circlezoid.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.Circlezoid'
      ],
      [
        'img/logos-21/BattleOutpost.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.BattleOutpostLastgenicsTD'
      ],
      [
        'img/logos-21/FoodOrchid.jpg',
        'https://play.google.com/store/apps/details?id=com.Teknack.FruitOrchid'
      ],
      [
        'img/logos-21/GARNER_CHESTLOGO.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.Garner'
      ],
      [
        'img/logos-21/HippiHangryLogo.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.HippiHangry'
      ],
      [
        'img/logos-21/Botcalypse.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.Botcalypse'
      ],
      [
        'img/logos-21/Ghoulhunterlogo.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.GhoulHunter'
      ],
      [
        'img/logos-21/Logo_Wave_Surfer.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.WaveSurfer'
      ],
      ['img/logos-21/logic.png', 'https://teknack.itch.io/logic-the-word-game'],
      [
        'img/logos-21/unreal.png',
        'https://www.mediafire.com/file/pep5irnlprrmu1i/kurokami_v1_1.exe'
      ]
    ];

    final teknack_2020 = [
      [
        'img/game-logos/spacetyccon.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.SpaceTycoon'
      ],
      [
        'img/game-logos/Holesync.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.HoleSync'
      ],
      [
        'img/game-logos/TrashZone_18.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.TrashZone'
      ],
      [
        'img/game-logos/SpaceRanger_9.jpeg',
        'https://play.google.com/store/apps/details?id=com.Teknack.SpaceRangerrr'
      ],
      [
        'img/game-logos/JungleTales_14.png',
        'https://play.google.com/store/apps/details?id=com.Tecknak.JungleTales'
      ],
      [
        'img/game-logos/dismantle.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.Dismantle'
      ],
      [
        'img/game-logos/The-Catacombs_13.jpg',
        'https://play.google.com/store/apps/details?id=com.Teknack.TheCatacombs'
      ],
      [
        'img/game-logos/appetite.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.Appetite'
      ],
      [
        'img/game-logos/astrotera.jpg',
        'https://play.google.com/store/apps/details?id=com.Tecknack.AstroTera'
      ],
      [
        'img/game-logos/balley.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.Balley'
      ],
      [
        'img/game-logos/cattotime.jpg',
        'https://play.google.com/store/apps/details?id=com.Teknack.CattoTime'
      ],
      [
        'img/game-logos/sdroids.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.SDROIDS'
      ],
      [
        'img/game-logos/blocker.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.Blocker'
      ],
      [
        'img/game-logos/wiggly.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.WigglyEscape'
      ],
      [
        'img/game-logos/geflect.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.Geflect'
      ],
      [
        'img/game-logos/sprint.jpg',
        'https://play.google.com/store/apps/details?id=com.Teknack.SprintRacing'
      ]
    ];

    final teknack_2019 = [
      [
        'img/game-logos/GetMeOut.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.GetMeOut'
      ],
      [
        'img/game-logos/UpsideDown.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.UpSideDown'
      ],
      [
        'img/game-logos/CoconutRescue.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.CoconutRescue'
      ],
      [
        'img/game-logos/BattleTank.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.BattleTank'
      ],
      [
        'img/game-logos/SpaceBreaker.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.SpaceBreaker'
      ],
      [
        'img/game-logos/Survival.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.Survival'
      ],
      [
        'img/game-logos/StackIt.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.StackIT'
      ],
      [
        'img/game-logos/OneFIneNight.png',
        'https://play.google.com/store/apps/details?id=com.Teknack.OneFineNight'
      ]
    ];
    return Scaffold(
        drawer: AppDrawer.Build(context),
        appBar: AppBar(
          title: Text("Teknack"),
          backgroundColor: const Color(0xFF003261),
          centerTitle: true,
          elevation: 0,
          shadowColor: Colors.blueGrey,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.lightbulb)),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.zero,
                height: 250,
                width: double.infinity,
                child: CustomPaint(
                  painter: TopBar(50, const Color(0xFF003261)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Link(
                target: LinkTarget.blank,
                uri: Uri.parse(
                    "https://play.google.com/store/apps/dev?id=7893964906406792543&hl=en_IN&gl=US"),
                builder: (context, followLink) {
                  return ElevatedButton(
                      onPressed: followLink,
                      child: Text("Official Teknack page"));
                },
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: teknack_2022.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 215,
                      margin: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0))),
                        child: Link(
                          target: LinkTarget.blank,
                          uri: Uri.parse(teknack_2022[index][1]),
                          builder: (context, followLink) {
                            return InkWell(
                              onTap: followLink,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    child: Card(
                                      elevation: 5,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                      child: Image.network(
                                          'https://dbit.acm.org/teknack/${teknack_2023[index][0]}',
                                          // width: 300,
                                          height: 200,
                                          fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                        teknack_2023[index][1].split(".").last),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: teknack_2022.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 215,
                      margin: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Link(
                          target: LinkTarget.blank,
                          uri: Uri.parse(teknack_2022[index][1]),
                          builder: (context, followLink) {
                            return InkWell(
                              onTap: followLink,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    child: Card(
                                      elevation: 5,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                      child: Image.network(
                                          'https://dbit.acm.org/teknack/${teknack_2022[index][0]}',
                                          // width: 300,
                                          height: 200,
                                          fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                        teknack_2022[index][1].split(".").last),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: teknack_2021.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 215,
                      margin: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Link(
                          target: LinkTarget.blank,
                          uri: Uri.parse(teknack_2021[index][1]),
                          builder: (context, followLink) {
                            return InkWell(
                              onTap: followLink,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    child: Card(
                                      elevation: 5,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                      child: Image.network(
                                          'https://dbit.acm.org/teknack/${teknack_2021[index][0]}',
                                          // width: 300,
                                          height: 200,
                                          fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                        teknack_2021[index][1].split(".").last),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: teknack_2020.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 215,
                      margin: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Link(
                          target: LinkTarget.blank,
                          uri: Uri.parse(teknack_2020[index][1]),
                          builder: (context, followLink) {
                            return InkWell(
                              onTap: followLink,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    child: Card(
                                      elevation: 5,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                      child: Image.network(
                                          'https://dbit.acm.org/teknack/${teknack_2020[index][0]}',
                                          // width: 300,
                                          height: 200,
                                          fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                        teknack_2020[index][1].split(".").last),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: teknack_2019.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 215,
                      margin: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Link(
                          target: LinkTarget.blank,
                          uri: Uri.parse(teknack_2019[index][1]),
                          builder: (context, followLink) {
                            return InkWell(
                              onTap: followLink,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    child: Card(
                                      elevation: 5,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                      child: Image.network(
                                          'https://dbit.acm.org/teknack/${teknack_2019[index][0]}',
                                          // width: 300,
                                          height: 200,
                                          fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                        teknack_2019[index][1].split(".").last),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
