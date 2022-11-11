import 'package:cupertino_lists/cupertino_lists.dart';
import 'package:flutter/cupertino.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'Dashboard',
        ),
        trailing: Container(
          margin: const EdgeInsets.only(bottom: 5),
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: CupertinoColors.activeBlue,
              image: DecorationImage(
                  image: AssetImage('assets/images/profile.jpeg'),
                  fit: BoxFit.cover)),
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Today',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 130,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    CupertinoColors.activeBlue,
                                    CupertinoColors.activeBlue.withOpacity(.6),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    FittedBox(
                                      child: Text(
                                        'Steps',
                                        style: TextStyle(
                                            color: CupertinoColors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    FittedBox(
                                      child: Text(
                                        '3600',
                                        style: TextStyle(
                                            color: CupertinoColors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 130,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    CupertinoColors.systemPink,
                                    CupertinoColors.systemPink.withOpacity(.6),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  FittedBox(
                                    child: Text(
                                      'Sports',
                                      style: TextStyle(
                                          color: CupertinoColors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  FittedBox(
                                    child: Text(
                                      '25 Min',
                                      style: TextStyle(
                                          color: CupertinoColors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CupertinoListSection.insetGrouped(
                  header: const Text('Health Categories'),
                  children: [
                    CupertinoListTile.notched(
                      title: const Text('Alarm'),
                      additionalInfo: Text('more'),
                      subtitle: Text('More Information'),
                      leading: const Icon(CupertinoIcons.alarm),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () {
                        print('Alarm');
                      },
                    ),
                    CupertinoListTile.notched(
                      title: const Text('Notification'),
                      additionalInfo: Text('more'),
                      subtitle: Text('More Information'),
                      leading: const Icon(CupertinoIcons.app_badge),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () {
                        print('Notification');
                      },
                    ),
                    CupertinoListTile.notched(
                      title: const Text('History'),
                      additionalInfo: Text('more'),
                      subtitle: Text('More Information'),
                      leading: const Icon(CupertinoIcons.arrow_2_squarepath),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () {
                        print('History');
                      },
                    ),
                    CupertinoListTile.notched(
                      title: const Text('Add'),
                      additionalInfo: Text('more'),
                      subtitle: Text('More Information'),
                      leading: const Icon(CupertinoIcons.add),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () {
                        print('Add');
                      },
                    ),
                  ],
                )
              ],
            )
          ]))
        ]),
      ),
    );
  }
}
