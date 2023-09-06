import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/providers/firebase_auth_providers.dart';
import 'package:tasktrack/providers/spotify_providers.dart';
import 'package:tasktrack/widgets/bottom_nav_bar.dart';
import 'package:tasktrack/widgets/root_app_bar.dart';
import 'package:tasktrack/widgets/root_svg_picture.dart';

import '../models/album_review.dart';
import '../providers/theme_providers.dart';

class FeedPage extends ConsumerWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.read(spotifyTokenProvider.notifier).state == '') {
      // Get initial access token
      getSpotifyAccessToken(ref);
    }

    final email = ref.read(firebaseAuthCurrentUserProvider)!.email;
    final albumRatings = AlbumReview.readFirestoreCollection(userEmail: email!);

    final currentTheme = Theme.of(context);
    final colors = ref.watch(svgColorsProvider(currentTheme));

    return Scaffold(
      appBar: RootNavAppBar(
          title: const Text('Disque'), appBar: AppBar(), ref: ref),
      body: FutureBuilder(
        future: albumRatings,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data.length == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RootSVGPicture(
                      svgString:
                          '<svg xmlns="http://www.w3.org/2000/svg" data-name="Layer 1" width="877" height="732.80939" viewBox="0 0 877 732.80939" xmlns:xlink="http://www.w3.org/1999/xlink"><title>unexpected friends</title><rect x="359.5" y="318.47698" width="98" height="98" transform="translate(76.96711 -238.61273) rotate(30)" fill="#${colors.highlight}"/><circle cx="749.5906" cy="150.79776" r="72" fill="#${colors.primaryColor}"/><path d="M867.06692,134.55262c8.97432,22.00456,31.813,33.49533,31.813,33.49533s8.28846-24.18565-.68586-46.19021-31.813-33.49533-31.813-33.49533S858.0926,112.54807,867.06692,134.55262Z" transform="translate(-161.5 -83.59531)" fill="#${colors.secondary}"/><path d="M875.51158,128.54068c18.93414,14.361,24.12593,39.39474,24.12593,39.39474s-25.5065,1.75-44.44064-12.61092-24.12593-39.39474-24.12593-39.39474S856.57744,114.17971,875.51158,128.54068Z" transform="translate(-161.5 -83.59531)" fill="#${colors.primaryColor}"/><path d="M902.48163,121.97491c-8.79357,22.07741-.30706,46.19428-.30706,46.19428s22.74371-11.67767,31.53728-33.75508.30706-46.19428.30706-46.19428S911.2752,99.8975,902.48163,121.97491Z" transform="translate(-161.5 -83.59531)" fill="#${colors.secondary}"/><path d="M912.735,123.49948c3.68293,23.47712-9.93657,45.114-9.93657,45.114s-19.59071-16.42707-23.27365-39.90418,9.93657-45.114,9.93657-45.114S909.05206,100.02237,912.735,123.49948Z" transform="translate(-161.5 -83.59531)" fill="#${colors.primaryColor}"/><circle cx="745.63136" cy="143.22647" r="37" fill="#f2f2f2"/><circle cx="730.08903" cy="132.90801" r="12" fill="#3f3d56"/><path d="M1016.5,678.477a22,22,0,1,1,22-22A22.02489,22.02489,0,0,1,1016.5,678.477Zm0-42a20,20,0,1,0,20,20A20.02229,20.02229,0,0,0,1016.5,636.477Z" transform="translate(-161.5 -83.59531)" fill="#${colors.secondary}"/><path d="M428.5,451.477a22,22,0,1,1,22-22A22.02489,22.02489,0,0,1,428.5,451.477Zm0-42a20,20,0,1,0,20,20A20.02229,20.02229,0,0,0,428.5,409.477Z" transform="translate(-161.5 -83.59531)" fill="#${colors.blackOrWhite}"/><path d="M957.03827,245.11382,840.06067,375.67407a57.98749,57.98749,0,1,1-77.1969,86.16052l-162.943,181.86285a267.09833,267.09833,0,0,0,164.3034,56.2024C912.389,699.89984,1032.5,579.78863,1032.5,431.624A267.36933,267.36933,0,0,0,957.03827,245.11382Z" transform="translate(-161.5 -83.59531)" fill="#${colors.highlight}"/><circle cx="645" cy="340.88168" r="35" fill="#${colors.highlight}"/><circle cx="461.96644" cy="71.96962" r="33.78065" fill="#2f2e41"/><path d="M559.94192,394.3267l7.83666,152.81483s-1.30611,109.71321,6.53055,111.01932,22.20387,10.44888,26.12219,3.91833,23.51-207.67143,23.51-207.67143,5.22444,208.97754,20.89775,210.28365,33.95885-6.53055,36.57107-5.22444S682.71623,398.245,682.71623,398.245Z" transform="translate(-161.5 -83.59531)" fill="#2f2e41"/><path d="M583.4519,656.85474s-9.14277,0-11.755,3.91833-11.755,23.51-11.755,23.51S542.9625,699.87469,561.248,701.1808s27.42831-2.53055,27.42831-5.14277,0-9.14276,3.91833-10.44887,7.83665-7.83666,7.83665-10.44888S596.513,655.54863,583.4519,656.85474Z" transform="translate(-161.5 -83.59531)" fill="#${colors.blackOrWhite}"/><path d="M653.98182,658.16085s-6.53055,26.1222,0,27.42831,10.44888,3.91833,11.755,7.83665,14.3672,8.44888,24.81608,7.14277,15.67332-8.44887,11.755-12.3672-23.51-26.1222-24.81609-30.04053S653.98182,658.16085,653.98182,658.16085Z" transform="translate(-161.5 -83.59531)" fill="#${colors.blackOrWhite}"/><path d="M608.268,180.12472s-2.61222,19.59164-7.83666,22.20386,2.61222,16.97943,2.61222,16.97943l23.51,3.91833,20.89775-16.97943s-3.91833-24.81608-3.91833-26.12219S608.268,180.12472,608.268,180.12472Z" transform="translate(-161.5 -83.59531)" fill="#${colors.primaryColor}"/><path d="M608.268,180.12472s-2.61222,19.59164-7.83666,22.20386,2.61222,16.97943,2.61222,16.97943l23.51,3.91833,20.89775-16.97943s-3.91833-24.81608-3.91833-26.12219S608.268,180.12472,608.268,180.12472Z" transform="translate(-161.5 -83.59531)" opacity="0.1"/><circle cx="461.13519" cy="82.16221" r="31.34663" fill="#${colors.primaryColor}"/><path d="M621.98213,218.655S608.921,196.45109,602.39049,197.7572s-26.77525,4.57138-29.38747,3.26527-19.59164,58.77494-19.59164,58.77494-18.28554,118.856-6.53055,133.22318,52.24438,6.53055,57.46882,20.89776S691.859,406.08169,691.859,398.245s1.30611-127.99874,2.61222-137.14151-11.755-57.46883-11.755-57.46883-30.69357-8.48971-35.918-5.87749S638.96156,208.20608,621.98213,218.655Z" transform="translate(-161.5 -83.59531)" fill="#${colors.blackOrWhite}"/><path d="M575.61524,204.9408l-2.61222-3.91833s-27.4283,3.91833-35.265,2.61222-31.34663,1.30611-31.34663,1.30611,5.22444-14.3672,10.44888-15.67331,11.755-5.22444,11.755-5.22444-13.06109-19.59165,0-26.12219c0,0-60.081,23.51-63.99937,45.71383s91.42768,56.16272,91.42768,56.16272Z" transform="translate(-161.5 -83.59531)" fill="#${colors.blackOrWhite}"/><path d="M672.26736,206.24691l10.44887-2.61222,52.24439,5.22444L717.98119,190.5736s10.44888-13.0611,3.91833-19.59165c0,0,69.22381,26.1222,61.38716,43.10162s-90.12157,47.01995-94.0399,48.32606S672.26736,206.24691,672.26736,206.24691Z" transform="translate(-161.5 -83.59531)" fill="#${colors.blackOrWhite}"/><path d="M535.71069,161.43827c3.23328.64219,5.99624,2.66188,8.64207,4.62812a83.955,83.955,0,0,1,7.36809,5.91758c11.87851,11.10521,16.24553,27.86021,20.02351,43.67638-2.68962,2.26643-7.08168.38166-8.88679-2.637S560.92732,206.318,560.218,202.873s-2.44347-7.14735-5.79577-8.21169c.70492,2.18657-.9964,4.56136-3.12342,5.42958s-4.5228.62843-6.8061.37433a9.40472,9.40472,0,0,1-3.08812-.70329c-1.77236-.8571-2.808-2.70068-3.77256-4.4169a135.83565,135.83565,0,0,0-8.28314-12.9597,9.622,9.622,0,0,0-2.61066-2.734c-4.18363-2.554-8.67637-5.89411-6.59325-11.95711C521.86452,162.68953,531.14621,160.53172,535.71069,161.43827Z" transform="translate(-161.5 -83.59531)" fill="#${colors.primaryColor}"/><path d="M709.36674,169.21164c-4.70064.2342-8.75385,3.29348-12.19593,6.50329a85.49458,85.49458,0,0,0-26.24941,51.21819c-.1676,1.31369-.22,2.86027.78591,3.72163,1.131.96847,2.99591.39511,3.92474-.76871a9.5512,9.5512,0,0,0,1.48795-4.16411,46.529,46.529,0,0,1,4.62409-12.71665c1.10461-2.04649,2.63911-4.20148,4.93629-4.5638,3.42081-.53956,5.979,3.08347,9.24662,4.23067,3.85668,1.354,8.17756-1.07085,10.52211-4.419s3.26106-7.45258,4.55269-11.3306c1.29148-3.87758,3.2068-7.85419,6.73168-9.9225,3.75324-2.20231,12.39444-3.73246,8.73005-9.91337C723.80078,172.59523,714.28543,168.96664,709.36674,169.21164Z" transform="translate(-161.5 -83.59531)" fill="#${colors.primaryColor}"/><path d="M588.68422,148.41223s-8.32986-21.65764,3.74843-28.738l3.332,9.57934s30.404-18.32569,38.31735-14.16076l-7.49688,9.99583s35.40191,0,37.90086,13.74427l-12.49478.41649s13.32777,8.74635,13.74426,22.90711l-26.65555,1.666,12.91129,7.49687s-48.31319,6.66389-59.975-12.49479Z" transform="translate(-161.5 -83.59531)" fill="#${colors.blackOrWhite}"/><path d="M508.35059,172.94112l19.59165-15.67332s-6.53055,19.59165,0,26.12219l-24.81609,5.22444Z" transform="translate(-161.5 -83.59531)" fill="#${colors.blackOrWhite}"/><path d="M736.91978,182.08388l-16.97942-13.06109s2.61222,16.97942-2.61222,20.89775,14.3672,5.22444,14.3672,5.22444Z" transform="translate(-161.5 -83.59531)" fill="#${colors.blackOrWhite}"/><circle cx="179.63425" cy="580.42464" r="72" fill="#${colors.primaryColor}"/><path d="M272.80694,578.946c14.35551,18.93827,39.38779,24.13728,39.38779,24.13728s1.75739-25.506-12.59812-44.44427-39.38779-24.13728-39.38779-24.13728S258.45143,560.00773,272.80694,578.946Z" transform="translate(-161.5 -83.59531)" fill="#${colors.secondary}"/><path d="M279.41131,570.95614c22.002,8.98066,33.48617,31.82267,33.48617,31.82267s-24.188,8.28149-46.19-.69917S233.2213,570.257,233.2213,570.257,257.40935,561.97548,279.41131,570.95614Z" transform="translate(-161.5 -83.59531)" fill="#${colors.primaryColor}"/><path d="M303.76881,557.6443c-2.79012,23.59987,11.64,44.70478,11.64,44.70478s18.95378-17.15806,21.7439-40.75793-11.64-44.70478-11.64-44.70478S306.55894,534.04442,303.76881,557.6443Z" transform="translate(-161.5 -83.59531)" fill="#${colors.secondary}"/><path d="M314.0679,556.46763c9.62433,21.72811,2.05834,46.14942,2.05834,46.14942s-23.17013-10.80693-32.79446-32.535-2.05835-46.14942-2.05835-46.14942S304.44356,534.73951,314.0679,556.46763Z" transform="translate(-161.5 -83.59531)" fill="#${colors.primaryColor}"/><circle cx="151.85305" cy="584.13356" r="37" fill="#f2f2f2"/><circle cx="137.81677" cy="595.87525" r="12" fill="#3f3d56"/><circle cx="463" cy="546.88168" r="72" fill="#${colors.primaryColor}"/><path d="M593.06365,525.988c6.20562,22.93969,27.46125,37.14681,27.46125,37.14681s11.19435-22.98545,4.98873-45.92514-27.46125-37.14681-27.46125-37.14681S586.858,503.04828,593.06365,525.988Z" transform="translate(-161.5 -83.59531)" fill="#${colors.secondary}"/><path d="M602.18237,521.058c17.0283,16.57636,19.10818,42.05809,19.10818,42.05809s-25.52845-1.39387-42.55675-17.97023-19.10818-42.05809-19.10818-42.05809S585.15406,504.48162,602.18237,521.058Z" transform="translate(-161.5 -83.59531)" fill="#${colors.primaryColor}"/><path d="M629.75437,517.85218c-11.43687,20.83115-5.97464,45.80731-5.97464,45.80731s24.00506-8.79781,35.44193-29.629,5.97465-45.80731,5.97465-45.80731S641.19125,497.021,629.75437,517.85218Z" transform="translate(-161.5 -83.59531)" fill="#${colors.secondary}"/><path d="M639.74308,520.62373c.77349,23.75164-15.39875,43.55323-15.39875,43.55323s-17.42632-18.70742-18.19981-42.45907,15.39875-43.55324,15.39875-43.55324S638.96959,496.87208,639.74308,520.62373Z" transform="translate(-161.5 -83.59531)" fill="#${colors.primaryColor}"/><circle cx="460" cy="538.88168" r="37" fill="#f2f2f2"/><circle cx="460" cy="517.88168" r="12" fill="#3f3d56"/><rect x="287" y="616.88168" width="375" height="2" fill="#${colors.blackOrWhite}"/><ellipse cx="813.5" cy="184.88168" rx="20.5" ry="16" fill="#${colors.primaryColor}"/><path d="M408.63894,606.50916l32.78777-26.258" transform="translate(-161.5 -83.59531)" fill="#${colors.secondary}"/><path d="M410.73734,626.74419Q425.60071,614.73263,441.51117,604.1" transform="translate(-161.5 -83.59531)" fill="#${colors.secondary}"/><path d="M432.607,624.61308a113.66528,113.66528,0,0,0,31.24964-21.96578" transform="translate(-161.5 -83.59531)" fill="#${colors.secondary}"/><circle cx="189" cy="630.88168" r="18" fill="#3f3d56"/><ellipse cx="99" cy="720.88168" rx="99" ry="11.92771" fill="#${colors.blackOrWhite}"/><path d="M793.5,701.477a22,22,0,1,1,22-22A22.02489,22.02489,0,0,1,793.5,701.477Zm0-42a20,20,0,1,0,20,20A20.02229,20.02229,0,0,0,793.5,659.477Z" transform="translate(-161.5 -83.59531)" fill="#${colors.blackOrWhite}"/></svg>'),
                  Text(
                    "Your feed is empty.",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .045,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Text(
                          "Add some friends",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * .04,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      const Text(" to see what they're posting")
                    ],
                  )
                ],
              ),
            );
          } else {
            print(snapshot.data[0].data);
            return ListView.separated(
              itemCount: snapshot.data.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return IntrinsicWidth(
                  child: SizedBox(
                    child: Center(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Row(children: [
                                Text(snapshot.data[index].id),
                              ])
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
