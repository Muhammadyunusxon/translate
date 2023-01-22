import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:provider/provider.dart';
import '../Controller/AppController.dart';
import '../components/Backgraund.dart';
import '../model/TranslateModel.dart';
import '../store/LocalStore.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  bool isLoading = true;

  getFav() async {
    isLoading = true;
    setState(() {});
    List<TranslateModel> listOfWords = await LocalStore.getFavourites();
    for (var element in listOfWords.reversed) {
      // ignore: use_build_context_synchronously
      context.read<AppController>().addFavourites(element);
    }
    isLoading = false;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getFav();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Favorites",
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 26),
                ),
                TextButton(
                    onPressed: () {
                      context.read<AppController>().removeAllFavourites();
                    },
                    child: Text(
                      "Clear All",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontSize: 12),
                    )),
              ],
            ),
          ),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: 575,
                  child: ListView.builder(
                      itemCount: context
                          .watch<AppController>()
                          .listOfFavourites
                          .length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 10,
                            right: 20,
                          ),
                          child: Slidable(
                            key: UniqueKey(),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              dismissible: DismissiblePane(onDismissed: () {
                                context
                                    .read<AppController>()
                                    .removeFavourites(index);
                              }),
                              children: [
                                SlidableAction(
                                  onPressed: (s) {
                                    context
                                        .read<AppController>()
                                        .removeFavourites(index);
                                  },
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ],
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(left: 5, right: 15),
                              height: 70,
                              width: 355,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Theme.of(context).hintColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, right: 20, bottom: 8),
                                    child: Icon(
                                      Icons.star_border,
                                      color: Color(0xffB5B5B5),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        context
                                                .watch<AppController>()
                                                .listOfFavourites[index]
                                                .text ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(fontSize: 14),
                                      ),
                                      Text(
                                        context
                                                .watch<AppController>()
                                                .listOfFavourites[index]
                                                .response ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 15,
                                    ),
                                    child: Icon(
                                      Icons.description_outlined,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
        ],
      ),
    );
  }
}
