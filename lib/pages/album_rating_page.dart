import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:tasktrack/providers/misc_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AlbumRatingPage extends HookConsumerWidget {
  const AlbumRatingPage(
      {super.key, this.albumName, this.albumUrl, this.artistName});

  final String? albumUrl;
  final String? albumName;
  final String? artistName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const List<double> ratings = [
      0,
      0.5,
      1,
      1.5,
      2,
      2.5,
      3,
      3.5,
      4,
      4.5,
      5,
      5.5,
      6,
      6.5,
      7,
      7.5,
      8,
      8.5,
      9,
      9.5,
      10
    ];
    final double selectedItem = ref.watch(dropdownSelectedDouble);
    return Scaffold(
        backgroundColor: const Color(0xfff0efe7),
        appBar: AppBar(
          title: Text(albumName!),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 25),
                Container(
                  height: 200,
                  width: 350,
                  color: const Color(0xff36454F),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: AutoSizeText(
                                albumName!,
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            Text(
                              artistName!,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 175,
                        width: 175,
                        child: Image.network(albumUrl!),
                      ),
                      const SizedBox(width: 15, height: 50),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 100,
                  height: 55,
                  child: DropdownButtonFormField<double>(
                      iconEnabledColor: Colors.white,
                      dropdownColor: const Color(0xff36454F),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xff36454F),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Theme.of(context).primaryColor))),
                      value: selectedItem,
                      items: ratings
                          .map(
                            (rating) => DropdownMenuItem<double>(
                              value: rating,
                              child: Text(
                                rating.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (rating) {
                        ref
                            .read(dropdownSelectedDouble.notifier)
                            .changeInt(rating!);
                      }),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 350,
                  child: TextField(
                    //COME BACK AND ADD AUTOSIZE TEXTFIELD
                    autocorrect: true,
                    style: const TextStyle(fontSize: 15),
                    maxLines: null,
                    maxLength: 1260,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color(0xff36454F),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color(0xff36454F),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 90,
                  child: ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> dataToSave = {
                        'AlbumName': albumName,
                        'ArtistName': artistName,
                        'Rating': selectedItem,
                        'Response': 'Test',
                      };
                      FirebaseFirestore.instance
                          .collection('rated_albums')
                          .add(dataToSave);
                    },
                    child: const AutoSizeText(
                      'Submit review!',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
