import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/providers/misc_providers.dart';
import 'package:tasktrack/widgets/root_app_bar.dart';
import 'package:tasktrack/widgets/root_svg_picture.dart';
import '../providers/firebase_auth_providers.dart';
import '../providers/theme_providers.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = Theme.of(context);
    final colors = ref.watch(svgColorsProvider(currentTheme));

    return Scaffold(
      appBar: RootNavAppBar(
          ref: ref,
          title: Text(
            'Login',
            style: GoogleFonts.pacifico(fontSize: 30),
          ),
          appBar: AppBar()),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RootSVGPicture(
                svgString:
                    '<svg xmlns="http://www.w3.org/2000/svg" data-name="Layer 1" width="987.9303" height="646.49701" viewBox="0 0 987.9303 646.49701" xmlns:xlink="http://www.w3.org/1999/xlink"><ellipse cx="190.05489" cy="636.79969" rx="190.05489" ry="9.69733" fill="#${colors.secondary}"/><path d="M848.11617,518.76958l-31.51263,4.086-1.60522.20738-41.94255,5.43772L581.60689,553.33134c-8.18729-5.66044-15.91375-11.48218-23.08723-17.44216l219.09057-12.94912,37.895-2.24265,1.58984-.09216Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.secondary}"/><path d="M709.10126,364.39394,542.64438,385.9835q7.24644-6.16352,15.13036-12.6419Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.secondary}"/><path d="M1093.96515,500.36737q-4.71187,7.77638-10.13806,15.22252L939.20547,496.83441,859.63674,486.512l78.27079,4.63129Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.secondary}"/><path d="M1026.03222,572.18662C972.7995,610.312,901.67145,633.59128,823.53894,633.59128c-63.90846,0-137.3636-21.88909-197.86966-53.7089,4.78488-12.40384,11.45145-22.45743,20.72168-27.54953.2304-.13055.46849-.26115.7066-.37633a29.29632,29.29632,0,0,1,12.78017-3.23346c54.5307-1.53607,48.3864,59.907,116.74179-24.57722,42.51089-52.54149,90.66689-70.62111,123.585-64.77633.60674.10754,1.20583.22274,1.80487.34563,19.07809,3.96308,32.7261,16.1749,36.66614,34.47722,10.75253,49.92247-20.737,89.86046,36.86583,77.57185A119.139,119.139,0,0,1,1026.03222,572.18662Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.highlight}"/><path d="M864.54465,631.55361c-26.78908-14.934-43.46616-35.323-49.56846-60.6-4.531-18.76743-3.22891-39.88623,3.86944-62.76986A168.114,168.114,0,0,1,842.224,460.96139c54.25277-76.79326,59.14939-126.832,53.70374-155.28693-5.97067-31.20005-25.36926-44.15769-25.56464-44.28482l.83741-1.28782c.20026.13013,20.11,13.38892,26.2243,45.222,3.5248,18.35191,1.86647,39.27795-4.92886,62.19648-8.45742,28.52317-24.94924,60.25949-49.01719,94.32769a166.59071,166.59071,0,0,0-23.166,46.79032c-11.64208,37.53186-13.28916,89.09017,44.97973,121.57428Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.secondary}"/><path d="M817.15355,486.2857c-21.11955-11.77259-20.53152-30.43051-16.31931-44.00919a59.66642,59.66642,0,0,1,8.298-16.76258c19.00632-26.90308,20.7239-44.3797,18.81806-54.30344-2.07011-10.77616-8.71056-15.20026-8.77731-15.24376l.837-1.28782c.29514.19164,7.25661,4.82987,9.44859,16.24206,2.85427,14.86011-3.5623,33.52592-19.07157,55.47951a58.123,58.123,0,0,0-8.08578,16.33056c-4.04382,13.03639-4.61985,30.942,15.6,42.21359Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.secondary}"/><path d="M912.17277,321.92627l-.74779-1.34182c20.21988-11.27194,19.64385-29.17757,15.6-42.21322a58.12548,58.12548,0,0,0-8.08577-16.33094c-15.50927-21.95321-21.92584-40.61939-19.07157-55.4795,2.192-11.41219,9.1535-16.05042,9.44859-16.24207l.83817,1.28708c-.06713.04425-6.74134,4.52647-8.79006,15.30526-1.88485,9.91811-.14851,27.37973,18.82968,54.24269a59.67383,59.67383,0,0,1,8.298,16.76221C932.70429,291.49463,933.29232,310.15256,912.17277,321.92627Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.secondary}"/><path d="M957.26458,245.50422a23.04115,23.04115,0,0,1-38.60146-25.16955l.00656-.01c6.95313-10.65769,41.95905-22.14561,41.95905-22.14561S964.21776,234.84653,957.26458,245.50422Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.highlight}"/><path d="M948.81616,174.07668a23.04115,23.04115,0,0,1-38.60146-25.16955l.00656-.01c6.95313-10.65769,41.95906-22.14562,41.95906-22.14562S955.76934,163.419,948.81616,174.07668Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.highlight}"/><path d="M947.723,390.29216c-1.47462-.34563-36.2591-8.43307-47.85645-2.91087a23.8097,23.8097,0,0,0,10.27635,45.30656,23.42745,23.42745,0,0,0,5.14587-.56834,23.88265,23.88265,0,0,0,5.0537-1.74344c11.59736-5.52988,27.23465-37.63387,27.89515-39.001l.42241-.8602ZM919.682,428.98592a22.27169,22.27169,0,1,1-19.15487-40.21448c2.70351-1.2903,6.83556-1.77417,11.55128-1.77417,12.903,0,30.15318,3.64818,34.34669,4.5775-2.619,5.2534-16.65107,32.6032-26.7431,37.41113Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.secondary}"/><path d="M843.04516,259.81159a23.71385,23.71385,0,0,1-16.03125-6.20468c-9.49322-8.65618-15.12825-43.92143-15.36376-45.41851l-.14851-.94654.9563.06075c1.51208.09638,37.1471,2.46125,46.64032,11.11743h0a23.79862,23.79862,0,0,1-16.053,41.39154Zm-29.71872-50.90615c.98255,5.78279,6.46382,36.03629,14.72248,43.56666a22.2733,22.2733,0,0,0,30.01424-32.91724h0C849.8045,212.02522,819.17523,209.35171,813.32644,208.90544Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.secondary}"/><path d="M810.96232,314.99231a23.04115,23.04115,0,1,1-31.0491,34.0519c-9.40317-8.574-15.12216-44.97012-15.12216-44.97012S801.5591,306.41835,810.96232,314.99231Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.highlight}"/><path d="M881.57959,315.83852a13.17215,13.17215,0,0,0-12.81856-10.3762,13.46253,13.46253,0,0,0-2.811.30721c-6.86621,1.49-19.0704,16.44369-19.585,17.07349l-.60673.745.8602.4301c.67588.33794,15.37614,7.61895,23.07185,7.61895a8.48659,8.48659,0,0,0,1.82788-.17666,13.1463,13.1463,0,0,0,10.06129-15.62189Zm-3.08753,9.06284a11.48772,11.48772,0,0,1-7.30405,5.06137c-5.5145,1.19813-19.38527-5.16891-23.01044-6.897,2.5806-3.07216,12.58047-14.60042,18.10267-15.79855a11.60753,11.60753,0,0,1,12.21182,17.63414Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.secondary}"/><path d="M285.59679,505.81436l40.14115-40.14121a10.62932,10.62932,0,0,1,17.72786,4.566v.00007a10.62876,10.62876,0,0,1-2.69555,10.46619l-25.6272,25.62727,35.76651,28.50954-.01822.02708c.1792-.00873.35536-.02708.53658-.02708A10.88547,10.88547,0,1,1,340.545,545.77664Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.primaryColor}"/><polygon points="298.107 626.991 310.014 622.546 298.535 574.503 280.961 581.063 298.107 626.991" fill="#${colors.primaryColor}"/><path d="M401.75809,743.8201H441.7033a0,0,0,0,1,0,0v15.43338a0,0,0,0,1,0,0H416.64495a14.88686,14.88686,0,0,1-14.88686-14.88686v-.54652A0,0,0,0,1,401.75809,743.8201Z" transform="translate(973.63979 1181.35883) rotate(159.52813)" fill="#${colors.blackOrWhite}"/><polygon points="190.985 623.171 203.695 623.17 209.742 574.146 190.983 574.147 190.985 623.171" fill="#${colors.primaryColor}"/><path d="M294.297,746.2902H334.2422a0,0,0,0,1,0,0v15.43338a0,0,0,0,1,0,0H309.18385A14.88686,14.88686,0,0,1,294.297,746.83673v-.54652A0,0,0,0,1,294.297,746.2902Z" transform="translate(522.53876 1381.24795) rotate(179.99738)" fill="#${colors.blackOrWhite}"/><path d="M329.13864,520.32831s31.10132-5.18355,41.46842,7.257l44.06021,203.71364-24.88106,3.11013s-8.29368-105.74449-49.76211-133.73567c0,0-30.06461,93.30395-24.881,135.80909l-21.77093-2.07342S286.6335,555.57647,329.13864,520.32831Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.blackOrWhite}"/><path d="M393.7618,593.85725l3.56795-4.682-.58525-.446,2.40554-3.15666a7.06835,7.06835,0,0,0-1.33772-9.90626l-.00014-.00012-8.65409-6.59488a7.06836,7.06836,0,0,0-9.90631,1.33749l-.00012.00016L358.831,597.20592a7.06838,7.06838,0,0,0,1.33767,9.90631l.00015.00014,8.6541,6.59486a7.06841,7.06841,0,0,0,9.90635-1.33756l.00009-.00014,9.54133-12.52056.58525.446,3.5679-4.682-.58525-.446,1.338-1.75572Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.highlight}"/><circle cx="280.76043" cy="454.39595" r="3.67906" fill="#${colors.secondary}"/><circle cx="230.63281" cy="288.22835" r="24.56103" fill="#${colors.primaryColor}"/><path d="M312.55127,461.23581s22.80763-26.95448,41.46842-5.18356l0,0a74.11253,74.11253,0,0,1,17.80945,50.43223l-.70374,23.69255-43.02349-6.73862Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.highlight}"/><path d="M345.14666,454.315a11.15981,11.15981,0,0,0-10.8351,13.14416l23.53885,130.27221-.13085.17919A10.66941,10.66941,0,0,0,361.913,613.938h0a10.82565,10.82565,0,0,0,13.44332-3.999,10.6191,10.6191,0,0,0-2.103-13.85689l-.15338-.12959-16.73468-131.883a11.15407,11.15407,0,0,0-11.06947-9.75561C345.24638,454.31394,345.19626,454.31394,345.14666,454.315Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.primaryColor}"/><path d="M340.649,419.22894l10.55232-12.43165c2.71945-3.20378,5.56392-6.69337,5.94852-10.87806.4216-4.58723-2.36858-9.04613-6.18309-11.62876s-8.49855-3.55452-13.09129-3.91114c-8.5182-.66143-17.48171.74628-24.4842,5.64142s-11.58379,13.73263-9.87638,22.10413c1.3444,6.59166,6.29828,12.90609,4.37281,19.352-2.1068,7.053-10.74665,9.21692-17.80072,11.32015-11.84039,3.53031-23.14639,10.48021-29.35158,21.16448s-6.17809,25.4167,2.09358,34.5948c5.35613,5.94306,13.43444,8.94841,21.42216,9.40066s15.93817-1.42893,23.51357-4.00216c6.97658-2.36982,13.87792-5.41792,19.37047-10.3292s9.44929-11.93946,9.278-19.30556c-.1632-7.0199-3.92355-13.41447-5.46827-20.26425a33.25514,33.25514,0,0,1,10.39525-31.73" transform="translate(-106.03485 -126.75149)" fill="#${colors.blackOrWhite}"/><path d="M323.88068,378.6355l6.64736-1.30437a4.26339,4.26339,0,0,1,5.00454,3.36269l9.1918,30.84329h0l-15.01459,2.94623h0L320.518,383.64A4.2634,4.2634,0,0,1,323.88068,378.6355Z" transform="translate(-106.03485 -126.75149)" fill="#${colors.highlight}"/><circle cx="232.47208" cy="290.19659" r="12.08986" fill="#${colors.blackOrWhite}"/><circle cx="232.47208" cy="290.19659" r="6.71659" fill="#${colors.highlight}"/></svg>'),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  TextField(
                    controller: _email,
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: _password,
                    decoration: const InputDecoration(hintText: 'Password'),
                    obscureText: true,
                    autocorrect: false,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) =>
                              const Center(child: CircularProgressIndicator()));

                      final loginAttemptResult = await ref
                          .watch(firebaseAuthServiceProvider)
                          .signInWithEmailAndPassword(
                              email: _email.text, password: _password.text);

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(loginAttemptResult!)));

                        Navigator.of(context).pop();
                      }
                      ref.read(stateNotifierNavBar.notifier).changeBool();
                    },
                    child: const Text(
                      'Login',
                    ),
                  ),
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 14),
                  ),
                  ElevatedButton(
                    onPressed: () => context.push('/register_page'),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
