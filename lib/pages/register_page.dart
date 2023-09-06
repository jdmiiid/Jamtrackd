import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/firebase_auth_providers.dart';
import '../providers/theme_providers.dart';
import '../widgets/root_app_bar.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({super.key});

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _regEmail = TextEditingController();
  final TextEditingController _regPassword = TextEditingController();
  final TextEditingController _confirmRegPassword = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacer = SizedBox(height: MediaQuery.of(context).size.height * .02);

    final currentTheme = Theme.of(context);
    final colors = ref.watch(svgColorsProvider(currentTheme));

    return Scaffold(
      appBar: RootNavAppBar(
        ref: ref,
        title: Text(
          'Welcome',
          style: GoogleFonts.pacifico(fontSize: 30),
        ),
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: SvgPicture.string(
              '<svg xmlns="http://www.w3.org/2000/svg" data-name="Layer 1" width="972.0042" height="639.89567" viewBox="0 0 972.0042 639.89567" xmlns:xlink="http://www.w3.org/1999/xlink"><path d="M748.37222,409.45784q-1.68018,8.835-4.03028,17.49c-.16992.67-.35986,1.33-.5498,2h-21.79a7.00779,7.00779,0,0,0-7,7v62.12c-.66016,1.23-1.33008,2.45-2,3.67-3.46,6.3-7.06006,12.53-10.74023,18.68a710.14341,710.14341,0,0,1-243.69,243.55l5.92041-13.36c-2.17041-.15-4.35009-.3-6.52-.44995-47.25-3.23-94.66016-6.81-140.8003-17.43-48.27-11.11-95.48974-30.38-133.31982-62.33-37.84033-31.96-65.58008-77.6-69.43018-126.98a144.88337,144.88337,0,0,1,5.07031-50.41c8.86963-31.52,28.25-59.88,56.21-76.66,43.91992-26.35,101.21-20.98,147.50976.94,46.29,21.91,83.97022,58.18,120.76026,93.81995a466.42118,466.42118,0,0,0-150.91016-157.52c-20.56006-13.16-42.37988-24.88-59.85986-41.93-17.47022-17.04-30.36036-40.93-27.27-65.14,3.50976-27.46,26-48.3,48.52978-64.37,9-6.42,18.29-12.51,27.87012-18.11,27.02978-15.84,56.27-27.79,87.1499-32.22,41.83008-6.01,87.01025,3.11,119.08008,30.63,36.12988,31.01,50.94971,81.02,49.54,128.86,22.25976-32.36,56.58984-57.13,95.35986-58.18,40.25-1.08,78.51026,24.35,98.66992,59.21C752.28237,327.18782,755.902,369.90786,748.37222,409.45784Z" transform="translate(-113.9979 -130.05217)" fill="#${colors.highlight}"/><path d="M493.714,543.853c23.57462-2.07613,45.35181-4.50171,68.19624-10.966,22.14346-6.26588,43.45115-16.755,59.21453-33.88211,16.95474-18.42154,26.107-42.34547,32.56437-66.16088,3.60029-13.2782,6.55859-26.74191,9.3499-40.21016q4.5429-21.91983,8.0729-44.0334,7.02688-44.01759,10.03312-88.55371.36315-5.406.66589-10.81583c.12515-2.22475-3.33532-2.21765-3.46007,0q-2.46957,43.89984-8.885,87.45746c-4.22061,28.53-9.62074,56.93651-16.4723,84.95519-5.80436,23.73626-13.31957,47.84312-28.20589,67.60251-13.95951,18.5292-34.12179,30.63771-55.89217,37.87744-22.15269,7.36687-45.51013,10.30809-68.65936,12.49516-2.83979.2683-3.68075.524-6.52219.77421-2.20087.19382-2.22133,3.6557,0,3.46007Z" transform="translate(-113.9979 -130.05217)" fill="#fff"/><path d="M121.48935,495.5606a375.00513,375.00513,0,0,1,87.7008,15.45407,379.00972,379.00972,0,0,1,81.67626,35.55178,369.763,369.763,0,0,1,68.78,51.786,378.86155,378.86155,0,0,1,53.72732,64.062A375.10127,375.10127,0,0,1,451.82,736.94738q1.82712,4.81062,3.51989,9.67046c.7291,2.089,4.073,1.19038,3.33647-.91983a378.64264,378.64264,0,0,0-36.72857-76.38714,383.57085,383.57085,0,0,0-52.70037-66.3915A373.9613,373.9613,0,0,0,301.967,549.22721a381.91664,381.91664,0,0,0-169.5742-56.37564q-5.44594-.45642-10.90341-.751c-2.225-.12179-2.21817,3.33866,0,3.46008Z" transform="translate(-113.9979 -130.05217)" fill="#fff"/><path d="M283.26691,168.09379A203.79908,203.79908,0,0,1,336.76826,194.238a251.24589,251.24589,0,0,1,45.67206,40.56014,336.2502,336.2502,0,0,1,37.81981,52.12109,444.66152,444.66152,0,0,1,30.07012,61.13547,553.19446,553.19446,0,0,1,21.8983,66.49512,621.48414,621.48414,0,0,1,14.00264,69.475,620.23132,620.23132,0,0,1,6.0274,69.86938,553.4891,553.4891,0,0,1-1.97945,67.02454,426.91315,426.91315,0,0,1-10.063,61.706,291.56248,291.56248,0,0,1-18.15494,53.35662q-2.69669,5.84088-5.72231,11.52063c-1.04652,1.96452,1.93922,3.71452,2.98767,1.74637A266.70637,266.70637,0,0,0,479.7605,697.819a398.28713,398.28713,0,0,0,12.18558-60.49935,526.37456,526.37456,0,0,0,4.02614-66.88946,613.74369,613.74369,0,0,0-4.18784-70.28791,633.10727,633.10727,0,0,0-12.19009-70.23182,573.11338,573.11338,0,0,0-20.38091-68.39936,475.91036,475.91036,0,0,0-28.34164-62.94527,364.89738,364.89738,0,0,0-36.34133-54.851A270.58336,270.58336,0,0,0,350.134,199.71859a214.68529,214.68529,0,0,0-52.06528-30.03253q-6.8463-2.725-13.882-4.92875c-2.129-.66982-3.04,2.66945-.91983,3.33648Z" transform="translate(-113.9979 -130.05217)" fill="#fff"/><ellipse cx="374.5042" cy="629.89567" rx="247.5" ry="10" fill="#${colors.blackOrWhite}"/><path d="M707.17106,446.73729a10.52585,10.52585,0,0,0-.2393,1.64013l-42.95745,24.782-10.44141-6.01094-11.13117,14.57228,22.33714,15.92056,49.00792-38.66268a10.4958,10.4958,0,1,0-6.57573-12.24133Z" transform="translate(-113.9979 -130.05217)" fill="#${colors.primaryColor}"/><path d="M609.33835,461.94155l33.82412,24.10721,15.128-18.96712L625.41026,440.699a13.32413,13.32413,0,0,0-19.18895,2.659v0A13.32412,13.32412,0,0,0,609.33835,461.94155Z" transform="translate(-113.9979 -130.05217)" fill="#${colors.surfaceColor}"/><polygon points="425.519 606.957 437.379 610.064 455.009 565.8 437.506 561.213 425.519 606.957" fill="#${colors.primaryColor}"/><path d="M535.34805,737.59489h38.53073a0,0,0,0,1,0,0v14.88687a0,0,0,0,1,0,0H550.23491a14.88686,14.88686,0,0,1-14.88686-14.88686v0A0,0,0,0,1,535.34805,737.59489Z" transform="translate(788.27138 1476.27215) rotate(-165.317)" fill="#${colors.blackOrWhite}"/><polygon points="530.942 615.401 543.011 613.245 540.439 565.668 522.627 568.85 530.942 615.401" fill="#${colors.primaryColor}"/><path d="M642.74684,738.96328h38.53072a0,0,0,0,1,0,0v14.88687a0,0,0,0,1,0,0H657.63371a14.88687,14.88687,0,0,1-14.88687-14.88687v0A0,0,0,0,1,642.74684,738.96328Z" transform="translate(1330.96309 1234.71881) rotate(169.87214)" fill="#${colors.blackOrWhite}"/><path d="M621.17529,395.56062c2.97389.7239,5.39344,3.75427,6.84643,7.26492A50.67542,50.67542,0,0,1,630.72578,414.24c1.14169,7.25673,2.2381,15.11271-.12326,21.83369-2.76764,7.87732-10.14212,12.00315-16.53891,10.06427s-11.48427-9.21664-13.22252-17.59408a42.6097,42.6097,0,0,1,2.92436-25.08432c1.81714-4.13706,4.32184-7.95379,7.6504-9.82035a7.54966,7.54966,0,0,1,10.06835,2.098" transform="translate(-113.9979 -130.05217)" fill="#${colors.blackOrWhite}"/><path d="M638.0021,526.94783,660.97891,732.7419l-18.97681,7.20593-35-138L558.2739,728.12594l-20.7718,1.154s28.5-196.3321,49.62152-200.79406Z" transform="translate(-113.9979 -130.05217)" fill="#${colors.blackOrWhite}"/><circle cx="504.70499" cy="267.21063" r="24.56103" fill="#${colors.primaryColor}"/><path d="M629.24429,432.12783l-26.54182-3.462s-17.30983,20.7718-16.15584,56.54546-2.885,46.73654-2.885,46.73654l55.34045,1C631.0021,521.94783,664.46353,458.77071,629.24429,432.12783Z" transform="translate(-113.9979 -130.05217)" fill="#${colors.surfaceColor}"/><path d="M643.5021,537.94783a10.52608,10.52608,0,0,0-1.65137.1424l-33.95508-36.14612,3.46192-11.53992-16.73291-7.50091L584.23843,508.291l48.852,38.85943a10.49579,10.49579,0,1,0,10.41162-9.20264Z" transform="translate(-113.9979 -130.05217)" fill="#${colors.primaryColor}"/><path d="M606.31244,446.19088l-15.72685,38.44341,21.92579,10.3859,18.158-38.04525a13.32414,13.32414,0,0,0-6.97982-18.0712h0A13.32412,13.32412,0,0,0,606.31244,446.19088Z" transform="translate(-113.9979 -130.05217)" fill="#${colors.surfaceColor}"/><path d="M612.27817,419.592c3.84844-2.22012,4.259-7.57567,3.736-11.98768s-1.39666-9.33053,1.19673-12.938c3.09522-4.30552,9.31374-4.39124,14.61451-4.53178s11.75595-1.69268,13.1294-6.81435c.90752-3.3842-1.03415-7.01583-3.82049-9.14014s-6.2722-3.0635-9.66037-3.95608c-7.57934-1.99671-15.4055-4.01025-23.16624-2.91282a29.5352,29.5352,0,0,0-25.16265,32.98007c1.25611,9.851,3.07792,14.15262,1.88212,18.49613-2.22732,8.09027-11.831,13.2875-12.02224,21.6766-.1496,6.562,5.64658,11.62417,11.30167,14.95607,4.48561,2.64287,9.32664,4.88544,14.496,5.50415s10.73488-.56586,14.58577-4.0696c4.96672-4.519,6.1953-12.06877,4.77109-18.63088s-5.07749-12.38957-8.69149-18.04895" transform="translate(-113.9979 -130.05217)" fill="#${colors.blackOrWhite}"/><path d="M1077.0021,426.94783h-355a9.01357,9.01357,0,0,0-9,9v228a9.01357,9.01357,0,0,0,9,9h355a9.01357,9.01357,0,0,0,9-9v-228A9.01357,9.01357,0,0,0,1077.0021,426.94783Zm7,237a7.00778,7.00778,0,0,1-7,7h-355a7.00778,7.00778,0,0,1-7-7v-228a7.00779,7.00779,0,0,1,7-7h355a7.00779,7.00779,0,0,1,7,7Z" transform="translate(-113.9979 -130.05217)" fill="#${colors.blackOrWhite}"/><path d="M797.77734,540.44336h-56a8.51014,8.51014,0,0,1-8.5-8.5v-56a8.51014,8.51014,0,0,1,8.5-8.5h56a8.51013,8.51013,0,0,1,8.5,8.5v56A8.51013,8.51013,0,0,1,797.77734,540.44336Z" transform="translate(-113.9979 -130.05217)" fill="#${colors.secondary}"/><path d="M1058.51333,599.95272H740.51321a6.5,6.5,0,1,1,0-13h318.00012a6.5,6.5,0,0,1,0,13Z" transform="translate(-113.9979 -130.05217)" fill="#${colors.blackOrWhite}"/><path d="M1058.72671,568.45272h-318a6.5,6.5,0,0,1,0-13h318a6.5,6.5,0,0,1,0,13Z" transform="translate(-113.9979 -130.05217)" fill="#${colors.blackOrWhite}"/><path d="M901.72671,525.443h-47a6.5,6.5,0,0,1,0-13h47a6.5,6.5,0,0,1,0,13Z" transform="translate(-113.9979 -130.05217)" fill="#${colors.blackOrWhite}"/><path d="M1058.72671,493.45272h-204a6.5,6.5,0,0,1,0-13h204a6.5,6.5,0,0,1,0,13Z" transform="translate(-113.9979 -130.05217)" fill="#${colors.blackOrWhite}"/><path d="M893.72671,631.95272H740.51321a6.5,6.5,0,1,1,0-13h153.2135a6.5,6.5,0,1,1,0,13Z" transform="translate(-113.9979 -130.05217)" fill="#${colors.blackOrWhite}"/></svg>',
              height: 170,
              width: 170,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                            controller: _firstName,
                            decoration: const InputDecoration(
                                hintText: 'First Name', filled: true)),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _lastName,
                          decoration: const InputDecoration(
                              hintText: 'Last Name', filled: true),
                        ),
                      )
                    ],
                  ),
                  spacer,
                  TextField(
                    controller: _regEmail,
                    decoration:
                        const InputDecoration(hintText: 'Email', filled: true),
                  ),
                  spacer,
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _regPassword,
                          decoration: const InputDecoration(
                              hintText: 'Password', filled: true),
                          obscureText: true,
                          autocorrect: false,
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        child: TextField(
                          controller: _confirmRegPassword,
                          decoration: const InputDecoration(
                            hintText: 'Confirm Password',
                            filled: true,
                          ),
                          obscureText: true,
                          autocorrect: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .02),
                  ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) =>
                              const Center(child: CircularProgressIndicator()));

                      final createUserMessage = await ref
                          .watch(firebaseAuthServiceProvider)
                          .createUserWithEmailAndPassword(
                              firstName: _firstName.text.trim(),
                              lastName: _lastName.text.trim(),
                              email: _regEmail.text,
                              confPass: _confirmRegPassword.text,
                              password: _regPassword.text);

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(createUserMessage!)));

                        Navigator.of(context).pop();
                      }
                    },
                    child: const AutoSizeText(
                      'Sign up',
                      minFontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
